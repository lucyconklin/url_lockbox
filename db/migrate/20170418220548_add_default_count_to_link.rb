class AddDefaultCountToLink < ActiveRecord::Migration[5.0]
  def change
    change_column :links, :read_count, :integer, :default => 0
  end
end
