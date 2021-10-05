# frozen_string_literal: true

class SubscriptionService < BaseService

  PLAN = ENV['STRIPE_PLAN']
  attr_reader :user, :stripe_token

  def initialize(user, stripe_token)
    @user = user
    @stripe_token = stripe_token
  end

  def subscribe(course)
    customer_id = stripe_customer_id

    params = subscription_params(customer_id)
    stripe_subscription = Stripe::Subscription.create(params)
    create_internal_subscription!(course, stripe_subscription)

  rescue StandardError => e
    Rollbar.error(e)
    error!(e.message)
  end

  def update_card
    customer = Stripe::Customer.retrieve(user.stripe_customer_id)
    card = Stripe::Customer.create_source(user.stripe_customer_id, { source: stripe_token })
    customer.default_source = card.id
    customer.save
  rescue => e
    Rollbar.error "Stripe error while updating card: #{e.message}"
    error!(e.message)
  end

  def retrieve_card
    default_source = Stripe::Customer.list({ email: user.email }).first&.default_source
    return error!('Card is empty') if default_source.blank?

    card = Stripe::Customer.retrieve_source(user.stripe_customer_id, default_source)
  rescue => e
    Rollbar.error "Stripe error while retrieving card: #{e.message}"
    error!(e.message)
  end

  def cancel
  end

  private

  def stripe_customer_id
    user.stripe_customer_id || create_stripe_customer
  end

  def create_internal_subscription!(course, stripe_subscription)
    user.subscriptions.create!(
      course: course,
      stripe_subscription_id: stripe_subscription.id,
      status: stripe_subscription.status
    )
  end

  def subscription_params(customer_id)
    params = {
      customer: customer_id,
      items: [
        { price: PLAN },
      ],
    }

    params.merge!({
      application_fee_percent: 51.50,
      transfer_data: {
        destination: 'acct_14NSJ54iRvIpDejY'
      },
    }) if ENV['STRIPE_DESTINATION_CHARGE'] == 'true'
    params
  end

  def create_stripe_customer
    customer = Stripe::Customer.create({
      email: user.email,
      source: stripe_token,
      metadata: {
        user_id: user.id
      },
      name: user.name,
      phone: user.phone
    })

    user.update_column(:stripe_customer_id, customer.id)

    customer.id
  end

end
