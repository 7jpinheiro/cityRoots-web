class Payment
  attr_accessor :ip, :money, :credit_card

  def initialize(remote_ip='',money='',payment_hash)
    @ip = remote_ip
    @money = money
    @credit_card = create_credit_card(payment_hash)
  end

  def purchase
    if @credit_card.valid?
      # or gateway.purchase to do both authorize and capture
      response = GATEWAY.purchase(price_in_cents, @credit_card,ip:@ip)
      if response.success?
        puts "Purchase complete!"
        true
      else
        puts "Error: #{response.message}"
        false
      end
    else
      puts "Error: credit card is not valid. #{@credit_card.errors.full_messages.join('. ')}"
      false
    end
  end


  def validate_card
    unless @credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end


  def price_in_cents
    (@money.to_f*100).round
  end

  def create_credit_card(payment_hash)
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :brand               => payment_hash[:card_type],
        :number             => payment_hash[:card_number],
        :verification_value => payment_hash[:card_verification],
        :month              => payment_hash["card_expires_on(2i)"],
        :year               => payment_hash["card_expires_on(1i)"],
        :first_name         => payment_hash[:first_name],
        :last_name          => payment_hash[:last_name]
    )
  end


end