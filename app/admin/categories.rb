ActiveAdmin.register Category do
  config.filters = false
  sortable tree: true,
           sorting_attribute: :created_at
          #  parent_method: :parent,
          #  children_method: :children,
          #  roots_method: :roots,

  permit_params :name, :parent_id
  

  action_item :view, only: :show do 
    link_to 'Add subcategory', new_admin_category_path(parent_id: resource)
  end
  action_item :view, only: :show do
    link_to 'Add Team',  '#'
  end
  action_item :view, only: :show do
    link_to 'Show articles',  '#'
  end

  index as: :sortable do
    label :name
    actions 
  end

  show do
    attributes_table do
      row :name
      row :parent do |c|
        c.is_root? ? "root category" : category.ancestors
      end
      row :children do |c|
        c.has_children? ? c.children : "none"
      end
      row 'Siblings categories' do |c|
        c.siblings
      end
      row 'Articles count' do |c|
        c.subtree_articles.count
      end
    end
  end

  form do |f|
    selected_parent = object.new_record? ? params[:parent_id] : object.parent.id
    
    if f.object.errors.size >= 1
      f.inputs "Errors" do
        f.object.errors.full_messages.join('|')
      end
    end

    f.inputs 'Create Category' do 
      f.input :name
     
      f.input :parent_id, as: :select, collection: option_groups_from_collection_for_select(Category.roots, :descendants, :name, :id, :name, selected: selected_parent)
      # f.input :parent_id, as: :select, collection: options_for_select(Category.all.map {|c| [c.name, c.id]}, params[:parent_id])
      # f.input :parent_id, as: :select, collection: Category.all.map {|c| [c.name, c.id]}
    end
    f.actions
  end
end
