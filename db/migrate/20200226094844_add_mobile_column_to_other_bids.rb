class AddMobileColumnToOtherBids < ActiveRecord::Migration[5.2]
  def up
    # Выставляем дефолтное значение nil чтобы источник старых заявок оставался "неизвестным"
    add_column :agency_bids, :mobile, :boolean, default: nil
    add_column :client_feedbacks, :mobile, :boolean, default: nil

    # Для новых заявок в будущем состояние по умолчанию аналогично Bid
    change_column_default :agency_bids, :mobile, false
    change_column_default :client_feedbacks, :mobile, false
  end

  def down
    remove_column :agency_bids, :mobile
    remove_column :client_feedbacks, :mobile
  end
end
