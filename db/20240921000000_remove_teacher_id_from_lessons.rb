class RemoveTeacherIdFromLessons < ActiveRecord::Migration[7.2]
    def change
      remove_reference :lessons, :teacher, foreign_key: true, index: true
    end
  end