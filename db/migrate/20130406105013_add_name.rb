class AddName < ActiveRecord::Migration
  def change
    add_column :clients, :name, :string
    add_column :users, :name, :string
  end
end
