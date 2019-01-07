class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :name
      t.string :channel_type, comment:'频道类型'
      t.string :portal_type, comment:'门户类型'
      t.string :collection_effect, comment:'收录效果'
      t.string :collection_type, comment:'门户类型'
      t.string :region, comment:'地区'
      t.string :real_price
      t.string :price
      t.string :url
      t.string :six_url
      t.text :remarks
      t.timestamps
    end
  end
end
