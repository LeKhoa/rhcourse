# frozen_string_literal: true

class SubscriptionServices
  PLAN = ENV['STRIPE_PLAN']

  def subscribe(user, course, stripe_token)
    stripe_customer_id = user.stripe_customer_id ||
      create_stripe_customer(user, stripe_token)

    stripe_subscription = Stripe::Subscription.create({
      customer: stripe_customer_id,
      items: [
        { price: PLAN },
      ],
      application_fee_percent: 51.50,
      transfer_data: [
        destination: 'acct_14NSJ54iRvIpDejY'
      ],
    })

    user.subscriptions.create!(
      course: course,
      stripe_subscription_id: stripe_subscription.id,
      status: stripe_subscription.status
    )
  end

  def cancel(user)
  end

  private

  def create_stripe_customer(user, stripe_token)
    customer = Stripe::Customer.create({
      email: user.email,
      source: stripe_token,
      meta_data: {
        user_id: user.id
      },
      name: user.name,
      phone: user.phone
    })

    user.update_column(stripe_customer_id: customer.id)

    customer.id
  end

end
