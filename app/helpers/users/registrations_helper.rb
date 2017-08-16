module Users::RegistrationsHelper
  def login_user_img(user)
    #user.avatar = SNSのプロフィール画像を表す
    return image_tag(user.avatar, alt: user.name,  :size => "50x50") if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
      image_tag(img_url, alt: user.name, :size => "50x50")
    else
      img_url = 'no_image.png'
      image_tag(img_url, alt: user.name, :size => "50x50")
    end
  end
end
