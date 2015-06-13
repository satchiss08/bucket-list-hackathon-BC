class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string   :name, null: false
      t.string   :place, null: false
      t.datetime :started_at, null: true
      t.datetime :ended_at, null: true
      t.timestamps
    end
  end
end
