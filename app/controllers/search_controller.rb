class SearchController < ApplicationController
  add_breadcrumb "Accueil", :root_path
    layout "front"
  
  

    def search_posts
      @ticker_posts = Post.order(id: :desc).last(5)
      @recent_posts = Post.order(id: :desc).last(5)
      @posts = Post.order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)
     add_breadcrumb "Recherche"
    end
    def index
   
  
        #@providers = User.search_providers(query)
        @properties = Property.order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)
  
  
    end
    
    def advanced_search
      add_breadcrumb "Recherche", advanced_search_path
      @cities = City.all
      
		
		#@featured = Property.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
		#@properties = Property.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)


      
     
  
      @term = params[:term] unless params[:term].blank?
      @city = City.find_by(name: params[:city]) unless params[:city].blank?
      

      if @property_type.present? || @offer_type.present? || @city.present?
        properties = Property.all
        properties = properties.search_property_type(@property_type.name) if @property_type.present?
        properties = properties.search_offer_type(@offer_type.name) if @offer_type.present?
        properties = properties.search_property_city(@city) if @city.present?

        @properties = properties.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)

      end
  
      @page_description = "Trouver un bien immobilier en un clin d'oeil et selon votre budget."
      @page_keywords    = APPLICATION_KEYWORDS
    end 
    
  
    def all_properties
      add_breadcrumb "Toutes les propriétés", all_properties_path
        @property_types = PropertyType.all
		  @offer_types = OfferType.all
		
      @properties = Property.order(created_at: :desc).paginate(:page => params[:page], :per_page => 9)
      @page_description = "Tous les biens immobiliers disponible dans votre région."
      @page_keywords    = APPLICATION_KEYWORDS
    end
  
    def show
    end
  end
  