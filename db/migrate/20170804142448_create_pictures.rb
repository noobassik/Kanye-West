class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :pic
      t.integer :priority, default: 0
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
