class CreateClientFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :client_feedbacks do |t|
      t.string :name
      t.string :phone
      t.string :comments

      t.timestamps
    end
  end
end
