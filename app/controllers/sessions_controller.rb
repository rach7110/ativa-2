class SessionsController < ApplicationController
	def new
	end


	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
      session[:remember_token] = user.id
			redirect_to user_url(user.id)
		else
			flash[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

  def destroy
    session.delete(:remember_token)
    redirect_to root_url
  end
end
