class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :currency_type
      t.timestamps null: false
    end
  end
end
