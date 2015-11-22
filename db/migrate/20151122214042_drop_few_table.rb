class DropFewTable < ActiveRecord::Migration
  def up
    drop_table :orders
    drop_table :order_items
    drop_table :order_statuses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
