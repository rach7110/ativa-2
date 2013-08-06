class AdminsController < ApplicationController
  def new
    @admin = Admin.new
    @generated_number = params[:generated_number]
  end

  def create
    generated_number = params[:admin][:generated_number].to_s
    
    admin = Admin.new(
      name: params[:admin][:name],
      email: params[:admin][:email],
      password: params[:admin][:password],
      password_confirmation: params[:admin][:password_confirmation]
    )
    
    if PotentialAdmin.find_by_email(admin.email) && PotentialAdmin.find_by_generated_number(params[:admin][:generated_number])
      if generated_number == PotentialAdmin.find_by_email(admin.email).generated_number.to_s && admin.save
        PotentialAdmin.find_by_email(admin.email).destroy
        redirect_to sign_in_path
      else redirect_to admin_new_path(generated_number: generated_number)
      end
    else redirect_to admin_new_path(generated_number: generated_number)
    end
  end
end
