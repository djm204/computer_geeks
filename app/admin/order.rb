# encoding: UTF-8
#
ActiveAdmin.register Order do
  scope :pending
  scope :paid
  
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

   index do
    column "Order Id:", :id
    column :status
    column "User", :user
    column "Total Products", :total_products do |order|
      lineitems(order.id).count
    end
    column "Order Total", sortable: :amount do |order|
      div class: :amount do
        number_to_currency(calculate_order_total(order.id))
      end
    end
    default_actions
  end

  show do
    div do
      render "show_orders"
    end
  end

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

  def format(amount)
    sprintf("%.2f",amount)
  end

  def calculate_order_amount
    lineitems = Lineitem.find_by(order_id: :id)
    lineitems.price.count 
  end
end
