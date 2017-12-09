ActiveAdmin.register User do
  decorate_with UserDecorator
  actions :all,except:[:new]
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
end
