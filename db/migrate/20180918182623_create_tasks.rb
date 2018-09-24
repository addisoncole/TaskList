class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :action
      t.string :description
      t.boolean :completed
      t.timestamps
    end
  end
end
