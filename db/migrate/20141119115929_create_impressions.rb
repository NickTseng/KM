class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.integer :post_id
      t.string :ip_address

      t.timestamps
    end
  end
end
