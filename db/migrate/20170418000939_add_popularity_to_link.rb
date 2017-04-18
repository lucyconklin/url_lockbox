class AddPopularityToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :popularity, :string, default: 'none'
  end
end
