class CreateHotReads < ActiveRecord::Migration[5.0]
  def change
    create_table :hot_reads do |t|
      t.integer :count, :default => 0
      t.string :url

      t.timestamps
    end
  end
end
