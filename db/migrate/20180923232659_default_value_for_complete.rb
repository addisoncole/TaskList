class DefaultValueForComplete < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tasks, :completed, from: nil,
  to: false)
  end
end
