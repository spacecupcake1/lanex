class RemoveAllTeacherReferences < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :lessons, :teachers rescue ActiveRecord::StatementInvalid
    remove_reference :lessons, :teacher, foreign_key: true, index: true rescue ActiveRecord::StatementInvalid
    remove_column :lessons, :teacher_id rescue ActiveRecord::StatementInvalid
  end
end