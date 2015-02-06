class UsersController < ApplicationController
  include SessionsHelper
  before_action :check
  helper_method :count


  def index
    @users = User.all
    @users_amount = User.all.count + 1
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  #    sign_in @user
      flash[:success] = "Пользователь #{@user.name} создан"
      redirect_to @user
  	else
  	  render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end



  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)  		
  	end

    def check
        redirect_to went_wrong_path, notice: "Please sign in." unless (signed_in? && current_user.admin == true)
    end

end
