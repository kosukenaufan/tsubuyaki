class RegistrationsController < ApplicationController
  def new
    @user = User.new
    redirect_to posts_url if logged_in?
  end

  def create
    @user = User.new(params_user)
      if @user.save
        login(@user.email, @user.password)
        redirect_to posts_url ,notice: '仮登録が完了しました。登録メールアドレスをご確認下さい!'
      else
        render :new
      end
    end

    private

      def params_user
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
