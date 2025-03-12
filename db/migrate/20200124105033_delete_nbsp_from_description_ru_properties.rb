class DeleteNbspFromDescriptionRuProperties < ActiveRecord::Migration[5.2]
  def change
    Property.connection.execute("UPDATE properties SET description_ru = REPLACE(description_ru, '&nbsp;', ' ') WHERE description_ru LIKE '%\&nbsp\;%'")
  end
end
