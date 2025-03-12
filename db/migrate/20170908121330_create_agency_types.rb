class CreateAgencyTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :agency_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    create_table :agencies_agency_types, id: false do |t|
      t.belongs_to :agency, index: true
      t.belongs_to :agency_type, index: true
    end
  end
end
