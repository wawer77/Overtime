module SmsTool
# establish the API credentials
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# send the message via the client
  def self.send_sms(number:, message:)
    @client.messages.create(
      from:  ENV['TWILIO_PHONE_NUMBER'],
      to: "+48#{number}",
      body: "#{message}"
    )
        puts "Sending SMS..."
        puts "#{message} to #{number}"
  end
end

