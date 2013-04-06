class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :ticket_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
