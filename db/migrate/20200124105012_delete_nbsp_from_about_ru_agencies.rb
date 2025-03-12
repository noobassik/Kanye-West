class DeleteNbspFromAboutRuAgencies < ActiveRecord::Migration[5.2]
  def change
    Agency.connection.execute("UPDATE agencies SET about_ru = REPLACE(about_ru, '&nbsp;', ' ') WHERE about_ru LIKE '%\&nbsp\;%'")
  end
end
