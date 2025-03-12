class MessengerAgencyIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :messengers, :agency_id, false

    Messenger.where(messenger_type_id: nil).update_all(messenger_type_id: MessengerType.first.id)
    change_column_null :messengers, :messenger_type_id, false
  end
end
