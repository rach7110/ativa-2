class AdminsController < ApplicationController
  def new
    @admin = Admin.new
    @generated_number = params[:generated_number]
  end

  def create
    
    admin = Admin.new(
      name: params[:admin][:name],
      email: params[:admin][:email],
      password: params[:admin][:password],
      password_confirmation: params[:admin][:password_confirmation]
    )
    
    if params[:admin][:generated_number].to_s == PotentialAdmin.find_by_email(admin.email).generated_number.to_s && admin.save
      redirect_to "http://www.google.com"
    else
      redirect_to "http://www.yahoo.com"
    end

  end
end
