module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : "Kanaku - Connecting travellers to their next adventure"
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : "Kanaku is an app which allows users to find the best places to be in new cities around the world."
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : "cover.png")
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
