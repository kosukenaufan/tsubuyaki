class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order('updated_at DESC')
    @post = Post.all.order('updated_at DESC').select { |x| x["counter"] > 0 }
    if params[:title].present?
      @posts = @posts.get_by_title params[:title]
    elsif params[:genre] then
      @posts = @posts.get_by_genre params[:genre]
    end

    @genres = Genre.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @same = Post.all.select { |x| x["title"] == @post.title }
    @same.delete_if { |h| h["id"] == @post.id}
    @similar= Post.all.select { |x| x["genre"] == @post.genre }
    @similar.delete_if { |h| h["id"] == @post.id}
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if params[:promote] then
      @post.increment!(:counter, by = 1)
      @post.touch
      redirect_to @post
    else
      @post.update(post_params)
      redirect_to @post
    end
  end
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :title, :genre, :price, :location, {image: []}, :channel, :status, :counter, :link)
    end
end
