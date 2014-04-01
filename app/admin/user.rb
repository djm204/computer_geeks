ActiveAdmin.register User do

  config.sort_order = "first_name_asc"

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :created_at
    column :updated_at
    default_actions
  end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :first_name, :last_name, :password, :email, :email_confirmation
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  form do |f|
    f.inputs "New User Details" do
      f.input :first_name
      f.input :last_name
      f.input :password      
      f.input :email
      f.input :email_confirmation
    end
    f.actions
  end
end
