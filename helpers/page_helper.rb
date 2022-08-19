module PageHelper
  def link_to_page(page)
    link_to page.data.fetch("title", page.request_path), page.request_path
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

  def remote_content(url)
    HTTP.get(url).body
  end

  def github_readme(url)
    remote_content github_readme_url url
  end

  def render_github_readme(url)
    render inline: github_readme(url), type: :markdown
  end

  def order_pages(pages)
    pages.sort_by { |r| r.data.fetch("order", Float::INFINITY) }
  end

  def order_glob(glob)
    order_pages site.resources.glob(glob).select{ |r| r.data.has_key? "title" }
  end

  def partial(path, **locals)
    render partial: path, locals: locals
  end
end
