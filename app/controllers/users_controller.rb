class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :login_user, except: [:acount_update, :profile_update]

  def account # ドロップダウンの設定を押すとaccountページへ
  end

  def profile
  end

  def account_update
    @user = User.find_by(id: params[:id])
    puts @user
    puts @user
    puts @user
    redirect_to users_account_path, notice: "パスワードを変更しました"
  end

  def profile_update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to users_profile_path, notice: "プロフィールを更新しました"
    else
      render :profile
    end
  end

  private

  def login_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:new_icon_img, :name, :email, :description, :password)
  end
end
