module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
      image_tag(img_url, alt: user.name)
    else
      img_url = 'no_image.png'
      image_tag(img_url, alt: user.name, :size => "50x50")
    end

  end
end
