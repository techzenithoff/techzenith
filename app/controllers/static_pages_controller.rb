class StaticPagesController < ApplicationController

	layout "front"
	add_breadcrumb "Accueil", :root_path

	def about
	end

	def contact 
    
	    add_breadcrumb "Contact", contact_path
	    @page_description = "Vous pouvez utiliser le formulaire ci-dessous pour nous contacter. 
	    Que ce soit pour des commentaires, des suggestions, 
	    pour un problème, simplement pour avoir de l'information ou de l'aide. "
	    
	    @page_keywords    = 'Nous rejoindre, Notre equipe, nous contacter, contactez-nous'
	    render layout: "front"
	 end

	def cgu
	end

	def privacy_policy
	end

end