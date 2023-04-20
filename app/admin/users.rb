ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :status, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :full_name
    # column :full_name do |user|
    #   link_to user.full_name, edit_admin_user_path(user)
    # end
    column :status
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end


  filter :email
  filter :roles
  filter :status
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :status
      row :role
    end
  end
  # form do |f|
  #   f.inputs do
  #     f.input :email, input_html: { readonly: true, disabled: true }
  #     f.input :full_name, input_html: { readonly: true, disabled: true }
  #     # f.input :role, as: :select, collection: Role.all.collect {|role| [role.name] }, include_blank: false
  #     f.input :status, include_blank: false
     
  #   end
  #   f.actions
  # end

  form do |f|
    if f.object.errors.size >= 1
      f.inputs "Errors" do
        f.object.errors.full_messages.join('|')
      end
    end
    
    f.inputs "User Details" do
      f.input :email, input_html: { readonly: true, disabled: true }
      f.input :full_name, input_html: { readonly: true, disabled: true }
      f.input :password
      f.input :password_confirmation
      f.input :status, as: :select, include_blank: false
      
      f.input :roles, as: :select, include_blank: false, input_html: { multiple: false }
      # f.input :roles, as: :radio, collection: role_ids
    end
    f.actions
  end
    # f.inputs "Admin Details" do
    #   f.input :email
    #   f.input :first_name
    #   f.input :last_name
    #   f.input :password, :hint => "Not Required if not changing the password"  , :required => false
    #   f.input :password_confirmation
    #   f.input :roles, as: :check_boxes
    # end
    # f.actions
  # end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete "password"
        params[:user].delete "password_confirmation"
      end

      super
    end
  end

end
