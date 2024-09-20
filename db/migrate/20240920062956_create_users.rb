class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
