class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :message
      t.references :item, polymorphic: true, null: false
      t.belongs_to :created_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
