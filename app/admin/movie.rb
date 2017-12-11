ActiveAdmin.register Movie do
  permit_params :title,:image,:genre,:plot,:rating,:web,:year,:cast,:view
  decorate_with MovieDecorator

  index do
    selectable_column
    id_column
    column :title
    column :image
    column :genre
    column :plot
    column :rating
    actions
  end

  filter :title
  filter :genre

  action_item :new_movie,only: :index do
    link_to "Automatically Movie Upload", "#{ Rails.application.secrets.url}/admin/movies/new?view=automatic"
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      render "movies/form",{movies: movie,view: params[:view]}
    end
  end



end
