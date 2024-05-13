module AccountsHelper
    def resource_name
	    :account
	end

	def resource
	    @resource ||= Account.new
	end
	
	def resource_class
		Account
	end
	
	def devise_mapping
	    @devise_mapping ||= Devise.mappings[:account]
	end
	

    def thumb_avatar(width)
		profile = current_account.accountable
		
        if profile && profile.avatar.attached?
            image_tag profile.avatar,  class: "wd-#{width} rounded-circle", alt: "Avatar"
        else
            image_pack_tag 'thumbnails/avatar-missing.png',  class: "wd-#{width} rounded-circle", alt: "Avatar"
        end
    end

    def user_thumb_avatar(user, alt, width)
		profile = user.profile
		
        if profile && profile.avatar.attached?
            image_tag profile.avatar,  class: "wd-#{width} rounded-circle", alt: "Avatar"
        else
            image_pack_tag 'thumbnails/avatar-missing.png',  class: "wd-#{width} rounded-circle", alt: "Avatar"
        end
    end

	

    def devise_title(controller)
		if controller == "sessions"
			t(:login)
		elsif controller == "registrations"
			t(:register)

		elsif controller == "admin_setup"
			t(:admin_setup)

		

		end
	end

	

end