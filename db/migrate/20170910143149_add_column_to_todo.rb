class AddColumnToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :status, :integer, after: :expired_at, default: 0, null: false
  end
end
