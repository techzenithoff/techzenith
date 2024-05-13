class LivesController < ApplicationController
    #before_action :authenticate_account!, except: [:show, :contact_us, :pmu_mali, :matches, :about_us]
    
    
    add_breadcrumb "Accueil", :root_path
    #layout "admin", except: [:show_page_path]
    layout "front"
    
  
   
  
    def live_tv
        emissions = Emission.all
        @latest_videos = emissions.map {|emission| emission.videos.where.not(title: "Private video").reorder(published_at: :desc).first}.compact
      add_breadcrumb "RenouveauTV en direct"
      
    end

    def live_radio
  
      
       
        add_breadcrumb "Radio Renouveau"
       
      end
  
   
  end
  
  