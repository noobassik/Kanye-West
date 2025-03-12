class ResizeImageForActiveAndModeratedProperty < ActiveRecord::Migration[5.2]
  def change
    properties = Property.where("properties.is_active = ? AND properties.moderated = ?", true, true)
    prop_count = properties.count
    properties.each_with_index do |property, index|
      p "Update " + index.to_s + " property pictures of " + prop_count.to_s if index % 100 == 0
      property.pictures.each do |user|
        if user.pic.file.exists?
          user.pic.recreate_versions!
        end
      end
    end
  end
end
