class RemoveAgencyFeature < ActiveRecord::Migration[5.2]
  def change
    drop_table :agency_features
  end
end
