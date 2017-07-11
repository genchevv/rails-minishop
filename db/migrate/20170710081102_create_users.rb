class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :city
      t.integer :zip_code
      t.string :bank_code
      t.string :card_number
    end
  end
end
