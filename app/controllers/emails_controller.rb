class EmailsController < ApplicationController
	#before_action :authenticate_account!
	layout("mailer")
	
	def welcome_email
		@account = current_account
		@password = "password"
		render "account_mailer/welcome_email"
	end
end