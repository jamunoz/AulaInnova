class UsersController < ApplicationController

	def update
	  authorize! :dashboard, @user if params[:user][:dashboard]
	end

end
