class AttensionsController < ApplicationController
  before_filter :require_login, except: [:index]
  before_action :set_attension, only: [:show, :edit, :update, :destroy]

  # GET /attensions
  # GET /attensions.json
  def index
    @post = Post.all.order('updated_at DESC').select { |x| x["counter"] > 0 }
  end

  # GET /attensions/1
  # GET /attensions/1.json
  def show
  end

  # GET /attensions/new
  def new
    @attension = Attension.new
  end

  # GET /attensions/1/edit
  def edit
  end

  # POST /attensions
  # POST /attensions.json
  def create
    @attension = Attension.new(attension_params)

    respond_to do |format|
      if @attension.save
        format.html { redirect_to @attension, notice: 'Attension was successfully created.' }
        format.json { render :show, status: :created, location: @attension }
      else
        format.html { render :new }
        format.json { render json: @attension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attensions/1
  # PATCH/PUT /attensions/1.json
  def update
    respond_to do |format|
      if @attension.update(attension_params)
        format.html { redirect_to @attension, notice: 'Attension was successfully updated.' }
        format.json { render :show, status: :ok, location: @attension }
      else
        format.html { render :edit }
        format.json { render json: @attension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attensions/1
  # DELETE /attensions/1.json
  def destroy
    @attension.destroy
    respond_to do |format|
      format.html { redirect_to attensions_url, notice: 'Attension was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attension
      @attension = Attension.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attension_params
      params.fetch(:attension, {})
    end
end
