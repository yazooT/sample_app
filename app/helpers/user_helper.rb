module UserHelper
  
  #引数で与えられたUserのイメージタグを返します
  #画像はGravatarから取得します
  def gravatar_for(user, size: 80 )
    email = user.email.downcase
    gravatar_id = Digest::MD5::hexdigest(email)
    
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
end
