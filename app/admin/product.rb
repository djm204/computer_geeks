# encoding: UTF-8
#
ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :name, :description, :category_id, :price, :stock_quantity, :productImage, :remove_productImage
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs 'New Product Details' do
      f.input :category
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :productImage, label: 'Current Filename (read only)' , as: :string, input_html: { readonly: true }
      f.input :productImage
      unless f.object.productImage.to_s == ''
        f.input :remove_productImage, label: 'Remove product image?', as: :boolean, input_html: { checked: false }
      end
    end
    f.actions
  end
end
