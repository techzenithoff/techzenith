module CustomsHelper
	def current?(key, path)
		"#{key}" if current_page? path
		# We use string interpolation "#{key}" here to access the CSS classes we are going to create.
	 end


	 def smtp_config?
		config = SmtpServerSetting.take

		if config.present? 
			true 
		else
			false
		end
	end
end