class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, default: ""
      t.integer :bucket_id
      t.boolean :completed, default: false
      t.integer :order, default: 0
      t.timestamps
    end
  end
end
