class Payment


  def purchase
    if credit_card.valid?
      # or gateway.purchase to do both authorize and capture
      response = GATEWAY.purchase(price_in_cents, credit_card,ip_address)
      if response.success?
        gateway.capture(1000, response.authorization)
        puts "Purchase complete!"
      else
        puts "Error: #{response.message}"
      end
    else
      puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
    end
  end

  def price_in_cents
    (value*100).round
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :brand               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
    )
  end


end