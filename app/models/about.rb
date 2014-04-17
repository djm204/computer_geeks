# encoding: UTF-8
#
class About < ActiveRecord::Base
  validate :there_can_only_be_one, on: :create
  mount_uploader :image, ImageUploader

  private

  def there_can_only_be_one
    errors.add(:base, 'You can\'t have more than one About Us page!') if About.count > 0
  end
end
