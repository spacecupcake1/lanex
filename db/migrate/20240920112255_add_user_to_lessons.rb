class AddUserToLessons < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:lessons, :user_id)
      add_reference :lessons, :user, null: false, foreign_key: true
    end
  end
end