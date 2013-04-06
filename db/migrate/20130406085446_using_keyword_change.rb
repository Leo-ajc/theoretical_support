class UsingKeywordChange < ActiveRecord::Migration

  def change
    rename_table :actions, :responses
  end

end
