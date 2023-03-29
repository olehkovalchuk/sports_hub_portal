module ApplicationHelper
  def categories_list
    @categories ||= Category.all
  end

  def render_categories(categories)
    category_class = 'p-1'
    subcategory_class = 'px-5 py-1'
   
    out = ''
    categories.each do |category|
      elem_class = "link-secondary text-decoration-none #{category.root? ? category_class : subcategory_class}"
      out << link_to(category.name.upcase, category_path(category.id), class: elem_class)
      render_categories(category.children) if category.has_children?
    end
    out.html_safe
  end
end
