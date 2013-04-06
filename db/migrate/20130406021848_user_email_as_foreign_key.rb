class UserEmailAsForeignKey < ActiveRecord::Migration
  def change
    rename_column :tickets, :client_id, :email
    change_column :tickets, :department_id, :integer
    change_column :tickets, :user_id, :integer
  end
end
