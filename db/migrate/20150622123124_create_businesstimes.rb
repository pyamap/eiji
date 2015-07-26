class CreateBusinesstimes < ActiveRecord::Migration
  def change
    create_table :businesstimes do |t|
      t.string :delivery_time #配達時間帯
      t.timestamps null: false
    end
  end
end
