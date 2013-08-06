class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
	  @user = User.find(params[:id])
  end

  def create
	  @user = User.new(params[:user])
	  if @user.save
      UserMailer.signup_confirmation(@user).deliver
		  flash[:success] = "Welcome to my awesome app!"
		  redirect_to user_url(@user.id)
	  else
		  render 'new'
	  end
  end

  def index
    @users = User.all
  end
end




 if PotentialAdmin.find_by_email(admin.email) && PotentialAdmin.find_by_generated_number(params[:admin][:generated_number])
      if generated_number == PotentialAdmin.find_by_email(admin.email).generated_number.to_s && admin.save
        PotentialAdmin.find_by_email(admin.email).destroy
        redirect_to sign_in_path
      else redirect_to admin_new_path(generated_number: generated_number)
      end
    else redirect_to admin_new_path(generated_number: generated_number)
    end