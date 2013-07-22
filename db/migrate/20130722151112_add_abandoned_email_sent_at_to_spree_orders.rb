class AddAbandonedEmailSentAtToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :abandoned_email_sent_at, :datetime, default: nil
  end
end
