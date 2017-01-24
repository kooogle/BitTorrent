module ApplicationHelper
  def model_errors(model,attribute)
    return model.errors.messages[attribute.to_sym][0] if model.errors.messages[attribute.to_sym]
  end

  def display_avatar(user)
    return image_path('sources/avatar.png') if user.avatar.nil?
    Settings.host + '/' + user.avatar
  end

  def display_banner(user)
    return image_path('sources/banner.jpg') if user.banner.nil?
    Settings.host + '/' + user.banner
  end

  def local_cover(cover)
    return image_path('logo.png') if cover.blank?
    Settings.host + '/'+ cover
  end

  def full_path(path)
    return Settings.host + '/'+ path if path.present?
  end

  def display_cover(cover)
    return image_path('sources/cover.jpg') if cover.blank?
    Settings.host + '/'+ cover
  end

  def display_bit_cover(cover)
    return image_path('sources/bit_cover.jpg') if cover.blank?
    Settings.host + '/'+ cover
  end

end
