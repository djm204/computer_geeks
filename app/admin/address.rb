# encoding: UTF-8
#
ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :user_id, :address, :city, :country, :postal_code, :province_id, :phone_number
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs 'New Address Details' do
      f.input :user_id, as: :select, collection: User.all
      f.input :address
      f.input :city
      f.input :country, as: :select, collection: country_dropdown
      f.input :postal_code
      f.input :province_id, as: :select, collection: Province.all
      f.input :phone_number
    end
    f.actions
  end
end
