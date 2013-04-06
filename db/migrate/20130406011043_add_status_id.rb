class AddStatusId < ActiveRecord::Migration
  def change
    add_column :tickets, :status_id, :string
  end
end
