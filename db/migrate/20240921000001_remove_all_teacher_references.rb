class RemoveAllTeacherReferences < ActiveRecord::Migration[7.2]
  def up
    # Remove foreign key if it exists
    foreign_keys = ActiveRecord::Base.connection.foreign_keys('lessons')
    teacher_foreign_key = foreign_keys.find { |fk| fk.to_table == 'teachers' }
    if teacher_foreign_key
      remove_foreign_key :lessons, name: teacher_foreign_key.name
    end

    # Remove index if it exists
    if index_exists?(:lessons, :teacher_id)
      remove_index :lessons, :teacher_id
    end

    # Remove column if it exists
    if column_exists?(:lessons, :teacher_id)
      remove_column :lessons, :teacher_id
    end

    # Drop teachers table if it exists
    drop_table :teachers if table_exists?(:teachers)
  end

  def change
    # Remove teacher_id if it exists
    if column_exists?(:lessons, :teacher_id)
      remove_column :lessons, :teacher_id
    end

    # Add user_id if it doesn't exist
    unless column_exists?(:lessons, :user_id)
      add_reference :lessons, :user, null: false, foreign_key: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end