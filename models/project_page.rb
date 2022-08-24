class ProjectPage < Sitepress::Model
  collection glob: "projects/{[!index]}*.html.*"
  data :title, :subtitle
end
