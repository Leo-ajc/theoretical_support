class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.text :body
      t.string :department_id
      t.string :user_id
      t.string :client_id

      t.timestamps
    end
  end
end
