Spree::Order.class_eval do

  ABANDONED_EMAIL_TIMEFRAME = 6.hours

  preference :abandedon_email_timeframe, 6.hours

  def self.email_eligible_abandoned_email_orders
    eligible_abandoned_email_orders.each {|o| o.send_abandoned_email }
  end

  def self.eligible_abandoned_email_orders
    where("state != ?
            AND (payment_state IS NULL OR payment_state != ?)
            AND email is NOT NULL
            AND abandoned_email_sent_at IS NULL
            AND created_at < ?",
          "complete",
          "paid",
          (Time.zone.now - Spree::AbandonedCartEmailConfig::Config.email_timeframe)).joins(:line_items).distinct
  end

  def send_abandoned_email
    # Don't send anything if the order has no line items.
    return if line_items.empty?

    Spree::AbandonedCartMailer.abandoned_email(self).deliver
    mark_abandoned_email_as_sent
  end

  private

  def mark_abandoned_email_as_sent
    update_attribute :abandoned_email_sent_at, Time.zone.now
  end

end
