class SerialCode < ActiveRecord::Migration

  def change
    add_column :tickets, :serial_code, :string
  end

end
