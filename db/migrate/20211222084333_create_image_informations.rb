class CreateImageInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :image_informations do |t|
      t.string   :image_name,        null: false
      t.text     :image_explanation, null: false
      t.integer  :category_id,       null: false
      t.integer  :status_id,         null: false
      t.integer  :delivery_id,       null: false
      t.integer  :prefecture_id,     null: false
      t.integer  :nissuu_id,         null: false
      t.integer  :price,             null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
