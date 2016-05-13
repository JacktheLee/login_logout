class CreateReples < ActiveRecord::Migration
  def change
    create_table :reples do |t|
      t.string :content
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
