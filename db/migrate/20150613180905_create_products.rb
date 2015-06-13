class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :activity, index:true
      t.integer    :bc_product_id, null: false
      t.string     :status, null: false
      t.timestamps
    end
  end
end
