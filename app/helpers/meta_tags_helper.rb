module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META['Bartuur']
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META['Exchange your goods. The opportunities are limitless!']
  end

  def meta_image
    content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META['meta_image']
  end
end
