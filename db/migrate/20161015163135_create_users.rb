class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :phone

      t.timestamps
    end
    add_index(:users, :email, unique: true)
  end
end
