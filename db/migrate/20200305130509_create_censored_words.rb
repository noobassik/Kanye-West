class CreateCensoredWords < ActiveRecord::Migration[5.2]
  def change
    create_table :censored_words do |t|
      t.integer :substitute_type, null: false, default: 1
      t.string :substitute, null: false

      t.timestamps
    end
  end
end
