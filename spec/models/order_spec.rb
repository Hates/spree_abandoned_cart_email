require "spec_helper"

describe Spree::Order do

  let(:order) { create :order }

  describe "#send_abandoned_email" do

    let(:mailer) { double "Mailer", deliver: true }

    it "returns if the order has no line items" do
      Spree::AbandonedCartMailer.should_not receive(:abandoned_email)

      order.send_abandoned_email
    end

    it "sends an email" do
      Spree::AbandonedCartMailer.should receive(:abandoned_email).and_return(mailer)

      order_with_line_items = create :order_with_line_items, line_items_count: 1
      order_with_line_items.send_abandoned_email
    end

    it "sets the email sent at" do
      Spree::AbandonedCartMailer.should receive(:abandoned_email).and_return(mailer)

      order_with_line_items = create :order_with_line_items, line_items_count: 1
      order_with_line_items.send_abandoned_email

      expect(order_with_line_items.abandoned_email_sent_at).not_to be_nil
    end

  end

end
