class CreateBankcards < ActiveRecord::Migration[5.0]
  def change
    create_table :bankcards do |t|
      t.string :name
      t.string :number
      t.date :expires_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
