class Booking < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :lesson

  after_create :create_activity

  private

  def create_activity
    Activity.create(user: self.user, trackable: self, action: 'create')
  end
end