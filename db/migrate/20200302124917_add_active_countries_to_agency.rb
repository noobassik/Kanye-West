class AddActiveCountriesToAgency < ActiveRecord::Migration[5.2]
  def change
    add_column "agencies_countries", :is_active, :boolean, default: true
  end
end
