class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :address
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.integer :price
      t.string :size
      t.string :picture

      t.timestamps
    end
  end
end
