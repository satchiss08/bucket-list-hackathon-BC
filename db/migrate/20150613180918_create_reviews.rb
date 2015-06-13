class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :activity, index:true
      t.text :gearhead_review, null: false
      t.timestamps
    end
  end
end
