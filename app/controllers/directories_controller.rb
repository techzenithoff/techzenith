class DirectoriesController < ApplicationController
	#before_action :authenticate_account!
	layout("front")

	add_breadcrumb "Accueil", :root_path
  add_breadcrumb "Annuaire", :directory_path
	
	def index
		
	end
end