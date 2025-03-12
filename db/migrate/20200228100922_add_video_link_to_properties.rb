class AddVideoLinkToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :video_link, :string
  end
end
