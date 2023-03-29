module ArticlesHelper
  def render_articles(articles)
    out = ''
    articles.each  do |article|
      out << tag.div(class: 'border') do
        link_to(article.name, article_path(article.id), class: "d-block") +
        tag.div(article.content, class: 'text-2xl font-bold') +
        tag.div("Comments count: #{article.comments.count}", class: 'text-2xl font-bold')
      end
    end
    out.html_safe
  end
end

