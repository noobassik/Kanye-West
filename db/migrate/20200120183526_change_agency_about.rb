class ChangeAgencyAbout < ActiveRecord::Migration[5.2]
  def change
    change_column_default :agencies, :about_ru, ''
    change_column_default :agencies, :about_en, ''

    Agency.where(about_ru: nil).update(about_ru: '')
    Agency.where(about_en: nil).update(about_en: '')
  end
end
