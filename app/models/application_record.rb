class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

  private

  def log_create
    log_activity('create')
  end

  def log_update
    log_activity('update')
  end

  def log_destroy
    log_activity('destroy')
  end

  def log_activity(action)
    Activity.create(
      user: Current.user,
      trackable: self,
      action: action
    )
  end
end