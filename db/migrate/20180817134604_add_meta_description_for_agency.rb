class AddMetaDescriptionForAgency < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :meta_description_en, :string
    add_column :agencies, :meta_description_ru, :string

    I18n.locale = :en
    Agency.all.each_with_index do |agency|
      agency.update_column(:meta_description_en, Agency::Presenter.new(agency).meta_description)
    end

    I18n.locale = :ru
    Agency.all.each_with_index do |agency|
      agency.update_column(:meta_description_ru, Agency::Presenter.new(agency).meta_description)
    end
  end
end
