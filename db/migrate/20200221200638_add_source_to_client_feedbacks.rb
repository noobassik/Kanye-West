class AddSourceToClientFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :client_feedbacks, :source, :string
  end
end
