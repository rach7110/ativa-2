class PotentialAdminsController < ApplicationController

  def create
    potential_admin = PotentialAdmin.new(params[:email])
      if potential_admin.save
        UserMailer.admin_confirmation(potential_admin).deliver
      end
      redirect_to user_url(@user.id)
  end

end
