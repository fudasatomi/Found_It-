class UsersController < ApplicationController
  def recipes
  	@user = User.find(params[:id])
  	@recipes = Recipe.where(user_id: @user.id)
  end

  def show
  	@user = User.find(params[:id])
  	@recipes = Recipe.where(user_id: @user.id)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def leave
  	@user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end


	private
	  def user_params
	    params.require(:user).permit(:name,:image, :introduction)
	  end
end
