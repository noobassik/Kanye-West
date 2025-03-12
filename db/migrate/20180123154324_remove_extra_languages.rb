class RemoveExtraLanguages < ActiveRecord::Migration[5.1]
  def change
    p "== " + Time.now.to_s + " delete Ghotuo ============================="
    AlternateName.where(:iso_language => 'Ghotuo').delete_all
    p "== " + Time.now.to_s + " delete Chinese ============================="
    AlternateName.where(:iso_language => 'Chinese').delete_all
    p "== " + Time.now.to_s + " finish ============================="
  end
end