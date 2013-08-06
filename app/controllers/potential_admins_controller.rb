class PotentialAdminsController < ApplicationController

	def create
    pams = params[:potential_admin][:email]
		potential_admin = PotentialAdmin.new(params[:potential_admin])
    if potential_admin.save then UserMailer.admin_confirmation(potential_admin).deliver end
    redirect_to users_url
	end

end