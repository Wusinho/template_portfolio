module ReposHelper

  def html_parse(html_string)
    sanitize(html_string, tags: ['h1', 'p', 'ul', 'li'])
  end
end
