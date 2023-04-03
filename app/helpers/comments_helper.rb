module CommentsHelper
  #this method has wrong subcomments order

  # def article_comments(comments)
  #   out = ''
  #   comment_class = 'p-1 m-1 border'
  #   subcomment_class = 'p-1 m-1 ms-5 border'
  #   comments.each do |comment|
  #     content_tag :div, class: "container" do
  #       out << tag.div(class: "#{comment.root? ? comment_class : subcomment_class}") do
  #         tag.div(comment.text) +
  #         tag.div(class:'d-flex justify-content-between') do
  #           tag.div( comment.id, class: 'text-secondary') +
  #           tag.div( comment.ancestry, class: 'text-secondary') +
  #           # tag.div( comment.author.full_name, class: 'text-secondary') +
  #           tag.div( comment.created_at.strftime("%d-%m-%Y %H:%M"), class: 'text-secondary')
  #         end
  #       end
  #     end
  #     article_comments(comment.children) if comment.has_children?
  #   end
  #   out.html_safe
  # end

  # Ну в окремму методі є сенс тільки тоді коли тут є рекурсія) а як її нема то це все мало б  бути у всьюсі)
  def article_comments(comments)
    out = ''
    comment_class = 'p-1 m-1 border'
    subcomment_class = 'p-1 m-1 ms-5 border'
    content_tag :div, class: "container" do
      comments.each do |comment|
        if comment.root?
          out << tag.div(class: comment_class) do
            tag.div(comment.text) +
            tag.div(class:'d-flex justify-content-between') do
              tag.div( comment.author.full_name, class: 'text-secondary') +
              tag.div( comment.created_at.strftime("%d-%m-%Y %H:%M"), class: 'text-secondary')
            end
          end
        end
        if comment.has_children?
          comment.children.each do |subcomment|
            out << tag.div(class: subcomment_class) do
              tag.div(subcomment.text) +
              tag.div(class:'d-flex justify-content-between') do
                tag.div( subcomment.author.full_name, class: 'text-secondary') +
                tag.div( subcomment.created_at.strftime("%d-%m-%Y %H:%M"), class: 'text-secondary')
              end
            end
          end
        end
      end
      out.html_safe
    end
  end
end
