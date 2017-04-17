class AddCountToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :read_count, :integer
  end
end
