class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
		t.integer :itemid #商品のID
		t.string :title #商品のタイトル
		t.string :currency #通貨
		t.string :created_by #作成者
		t.string :updated_by #更新者
		t.string :type #種類
		t.string :spikeurl #SpikeのURL
		t.text :details #絵の詳細 #改行するぐらい長いやつはデータ型。
		t.boolean :delete, null: false, default: false #削除フラグ
	    t.timestamps
    end
  end
end
