class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.string :lesson_id
      t.string :teaching_language
      t.string :known_language
      t.string :available_days
      t.string :meeting_platform
      t.string :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
