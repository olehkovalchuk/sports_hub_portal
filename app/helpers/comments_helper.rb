module CommentsHelper
  #this method has wrong subcomments order

  def article_comments(comments)
    @out = ''
    render_comments(comments)
    @out.html_safe
  end
  
  def render_comments(comments)
    comment_class = 'p-1 m-1 border'
    content_tag :div, class: "container" do
      comments.each do |comment|
        case comment.depth
        when 1
          comment_class << " ms-4"
        when 2
          comment_class << " ms-5"
        end
        @out << tag.div(class: comment_class) do
          tag.div(comment.text) +
          tag.div(class:'d-flex justify-content-between') do
            tag.div( comment.author.full_name, class: 'text-secondary') +
            tag.div( comment.created_at.strftime("%d-%m-%Y %H:%M"), class: 'text-secondary')
          end +
          comment_actions(comment)
        end
        if comment.has_children?
          render_comments(comment.children)
        end
      end
    end
  end

 
  # def article_comments2(comments)
  #   out = ''
  #   comment_class = 'p-1 m-1 border'
  #   subcomment_class = 'p-1 m-1 ms-5 border'
  #   content_tag :div, class: "container" do
  #     comments.each do |comment|
  #       if comment.root?
  #         out << tag.div(class: comment_class) do
  #           tag.div(comment.text) +
  #           tag.div(class:'d-flex justify-content-between') do
  #             tag.div( comment.author.full_name, class: 'text-secondary') +
  #             tag.div( comment.created_at.strftime("%d-%m-%Y %H:%M"), class: 'text-secondary')
  #           end +
  #           comment_actions(comment)
  #         end
  #       end
  #       if comment.has_children?
  #         comment.children.each do |subcomment|
  #           out << tag.div(class: subcomment_class) do
  #             tag.div(subcomment.text) +
  #             tag.div(class:'d-flex justify-content-between') do
  #               tag.div( subcomment.author.full_name, class: 'text-secondary') +
  #               tag.div( subcomment.created_at.strftime("%d-%m-%Y %H:%M"), class: 'text-secondary')
  #             end +
  #             comment_actions(subcomment)
  #           end
  #         end
  #       end
  #     end
  #     out.html_safe
  #   end
  # end

  def comment_actions(comment)
    tag.div(class: 'comment-buttons') do
      render 'comments/action_buttons', model: comment
    end +
    tag.div(class: 'comment-form reply-comment-form d-none') do
      render 'comments/form', model: Comment.new(parent: comment)
    end +
    if can? :edit, comment
      tag.div(class: 'comment-form edit-comment-form d-none') do
        render 'comments/form', model: comment
      end
    end
  end
end
