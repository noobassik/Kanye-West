class RemoveRoomCounts < ActiveRecord::Migration[5.1]
  def up
    drop_table :room_counts
  end

  def down
    create_table :room_counts do |t|
      t.string :title_ru
      t.string :title_en
    end
  end
end
