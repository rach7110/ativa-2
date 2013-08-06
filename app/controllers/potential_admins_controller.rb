class PotentialAdminsController < ApplicationController

	def create
    pams = params[:potential_admin][:email]
		potential_admin = PotentialAdmin.new(params[:potential_admin])

    if potential_admin.save
      UserMailer.admin_confirmation(potential_admin).deliver
      redirect_to users_url
    else
      redirect_to "http://www.google.com"
    end
	end

end