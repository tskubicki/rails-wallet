class CreateUsercards < ActiveRecord::Migration
  def change
    create_table :usercards do |t|
      t.integer :user_id
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
