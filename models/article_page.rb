class ArticlePage < Sitepress::Model
  collection glob: "articles/{[!index]}*.html.*"
  data :title

  def publish_at
    Chronic.parse data.fetch("publish_at")
  end

  def published?
    publish_at < Time.current
  end

  def self.published
    all.select(&:published?).sort_by(&:publish_at)
  end
end
