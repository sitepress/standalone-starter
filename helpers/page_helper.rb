require "open-uri"

module PageHelper
  def link_to_page(page, **kwargs)
    link_to page.data.fetch("title", page.request_path), page.request_path, **kwargs
  end

  def link_to_if_current(text, page, active_class: "active")
    if page == current_page
      link_to text, page.request_path, class: active_class
    else
      link_to text, page.request_path
    end
  end

  def github_readme_url(url)
    "https://raw.githubusercontent.com/#{URI(url).path}/main/README.md"
  end

  def date(value)
    Chronic.parse(value)
  end

  def remote_content(url)
    URI.open(url).read
  end

  def github_readme(url)
    remote_content github_readme_url url
  end

  def render_github_readme(url)
    render inline: github_readme(url), type: :markdown
  end
end
