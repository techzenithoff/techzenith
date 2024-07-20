class StaticPagesController < ApplicationController

	layout "front"
	add_breadcrumb "Accueil", :root_path

	def about
		@page_title = "Présentation"
		add_breadcrumb "Présentation", :about_path
	end

	def contact 
    
	    add_breadcrumb "Contact-nous", contact_path
	    @page_title = "Contact-nous"
	    @page_description = "Vous pouvez utiliser le formulaire ci-dessous pour nous contacter. 
	    Que ce soit pour des commentaires, des suggestions, 
	    pour un problème, simplement pour avoir de l'information ou de l'aide. "
	    
	    @page_keywords    = 'Nous rejoindre, Notre equipe, nous contacter, contactez-nous'
	    render layout: "front"
	 end

	def cgu
		add_breadcrumb "Conditions générales d'utilisation", :cgu_path
		@page_title = "Conditions générales d'utilisation"
	end

	def privacy_policy
		add_breadcrumb "Politique de confidentialités", :privacy_policy_path
		@page_title = "Politique de confidentialités"
	end



	def team
		add_breadcrumb "L'Équipe", :team_path
		@page_title = "L'Équipe"
	end

	def services
		add_breadcrumb "Services", :services_path
		@page_title = "Services"
	end

	def solutions
		add_breadcrumb "Solutions", :solutions_path
		@page_title = "Solutions"
	end

	def blog
		add_breadcrumb "Blog", :blog_path
		@page_title = "Blog"
	end


end