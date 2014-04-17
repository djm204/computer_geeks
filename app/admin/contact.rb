# encoding: UTF-8
#
ActiveAdmin.register Contact do
  menu label: 'Contact Us'
  # change page tile from the default pluralized Contacts
  controller do
    before_filter { @page_title = 'Contact Us' }
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
  permit_params :list, :of, :attributes, :on, :model, :page_title, :page_left_description, :page_right_description, :image, :remove_image
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
    f.inputs 'Contact Us' do
      f.input :page_title
      f.input :page_left_description
      f.input :page_right_description
      f.input :image, label: 'Current Filename (read only)' , as: :string, input_html: { readonly: true }
      f.input :image
      f.input :remove_image, label: 'Remove contact image?', as: :boolean, input_html: { checked: false }
    end
    f.actions
  end
end
