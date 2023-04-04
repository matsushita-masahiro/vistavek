class AddColumnToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :display_order, :integer, default: 99, null: false
  end
end
