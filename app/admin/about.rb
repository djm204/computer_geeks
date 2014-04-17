# encoding: UTF-8
#
ActiveAdmin.register About do
  menu label: 'About Us'

  # change page tile from the default pluralized Abouts
  controller do
    before_filter { @page_title = 'About Us' }
  end

  # disable destroy action
  actions :all, except: :destroy

  index do
    selectable_column
    id_column
    column :page_title
    default_actions
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :page_title, :page_left_description, :page_right_description, :image
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs 'About Us' do
      f.input :page_title
      f.input :page_left_description
      f.input :page_right_description
      f.input :image, label: 'Current Filename (read only)' , as: :string, input_html: { readonly: true }
      f.input :image
    end
    f.actions
  end
end
