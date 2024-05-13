module MetaTagsHelper
    #def meta_image
        #metag_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    #end

    def meta_title
        content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
    end

    def meta_site_name
        content_for?(:meta_site_name) ? content_for(:meta_site_name) : DEFAULT_META["meta_site_name"]
    end

    def meta_type
        content_for?(:meta_type) ? content_for(:meta_type) : DEFAULT_META["meta_type"]
    end

    def meta_description
      content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
    end

    def meta_published_time
      content_for?(:meta_published_time) ? content_for(:meta_published_time) : DEFAULT_META["meta_published_time"]
    end

    def meta_modified_time
      content_for?(:meta_modified_time) ? content_for(:meta_modified_time) : DEFAULT_META["meta_modified_time"]
    end

    def meta_keywords
      content_for?(:meta_keywords) ? content_for(:meta_keywords) : DEFAULT_META["meta_keywords"]
    end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # ajoutez la ligne ci-dessous pour que le helper fonctionne indifféremment
    # avec une image dans vos assets ou une url absolue
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end