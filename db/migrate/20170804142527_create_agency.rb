class CreateAgency < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name_ru
      t.string :name_en

      t.string :about_ru
      t.string :about_en

      t.string :website

      t.string :logo

      t.string :prian_link
      t.text :prian_properties_links

      t.timestamps
    end

    create_table :agency_features do |t|
      t.string :title_ru
      t.string :title_en
      t.string :description_ru
      t.string :description_en

      t.belongs_to :agency, index: true
    end

    create_table :agency_other_contacts do |t|
      t.string :title_ru
      t.string :title_en
      t.text :content_ru
      t.text :content_en

      t.belongs_to :agency, index: true
    end

    create_table :contact_people do |t|
      t.string :role_ru
      t.string :role_en
      t.string :name_ru
      t.string :name_en
      t.string :avatar

      t.belongs_to :agency, index: true
    end

    create_table :agency_contacts do |t|
      t.string :ctype
      t.string :value

      t.integer :contactable_id
      t.string  :contactable_type
    end

    add_index :agency_contacts, [:contactable_type, :contactable_id]

    create_table :messenger_types do |t|
      t.string :title
    end

    create_table :messengers do |t|
      t.string :phone

      t.belongs_to :messenger_type, index: true
      t.belongs_to :agency, index: true
    end
  end
end
