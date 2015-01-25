class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :name, default: ""
      t.integer :project_id
      t.integer :order, default: 0
      t.timestamps
    end
  end
end
