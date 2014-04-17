# encoding: UTF-8
#
class ContactsController < InheritedResources::Base
  def index
    @contact = Contact.first
    @user = User.find_by(first_name: 'Computer', last_name: 'Geeks')
    @winnipeg_address = Address.find_by(user_id: @user.id, city: 'Winnipeg')
    @addresses = @user.addresses.find(:all, conditions: ['city != ?', 'Winnipeg'])
  end
end
