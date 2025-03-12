class SettingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :settings, primary_key: 'key', id: :string do |t|
      t.text :value
    end
  end
end
