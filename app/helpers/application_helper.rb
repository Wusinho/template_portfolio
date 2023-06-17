module ApplicationHelper
  def nav__link
    'nav__link'
  end

  def social_icon(name)
    social_name = "fa-brands fa-#{name.downcase} social_media"
    content_tag(:i, "", class: social_name)
  end
end
