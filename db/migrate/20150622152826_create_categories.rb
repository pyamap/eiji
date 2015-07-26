class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
  	  t.string :landscape
  	  t.string :person
  	  t.string :rest
      t.timestamps null: false
    end
  end
end
