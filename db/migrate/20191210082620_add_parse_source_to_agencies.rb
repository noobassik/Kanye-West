class AddParseSourceToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :parse_source, :string, limit: 100
  end
end
