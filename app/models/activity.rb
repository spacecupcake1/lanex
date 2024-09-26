class Activity < ApplicationRecord
  paginates_per 20
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  def description
    "#{user.user_name} #{action}d a #{trackable_type.downcase}"
  end
end