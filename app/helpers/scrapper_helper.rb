module ScrapperHelper
  def social_icon(name)
    other_icons = {
      aws: 'devicon-amazonwebservices-original',
    }
    social_name = if other_icons.keys.include?(name.downcase.to_sym)
                    other_icons[name.downcase.to_sym]
                  else
                    "fa-brands fa-#{name.downcase} social_media"
                  end
    content_tag(:i, "", class: social_name)
  end
end
