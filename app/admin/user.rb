ActiveAdmin.register User do
  decorate_with UserDecorator
  index do
    selectable_column
    id_column
    column :email
    column :image
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end


  filter :name
  filter :email
  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
