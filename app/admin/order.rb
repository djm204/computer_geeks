# encoding: UTF-8
#
ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :status, :pst_rate, :gst_rate, :hst_rate, :user_id, :session_id
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  form do |f|
    f.inputs 'Order' do
      f.input :user_id, as: :select, collection: User.all
      f.input :status
      f.input :pst_rate
      f.input :gst_rate
      f.input :hst_rate
      f.input :session_id
    end
    f.actions
  end
end
