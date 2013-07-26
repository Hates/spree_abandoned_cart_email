module Spree
  class AbandonedCartMailer < ActionMailer::Base
    default from: Spree::AbandonedCartEmailConfig::Config.email_from

     def abandoned_email(order)
       @order = order
       mail to: @order.email, subject: Spree.t("abandoned_cart.email.subject")
     end

  end
end
