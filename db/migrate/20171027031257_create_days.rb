class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.date :date
      t.belongs_to :song
      t.integer :streams
      t.integer :position
      t.timestamps
    end
  end
end
