
require 'twilio-ruby'

class TwilioController < OpenReadController



  def sendMsg

    send_to = params[:number]
    text_content = params[:text]


  # To find these visit https://www.twilio.com/user/account
  account_sid = "AC0761429138772f0625446afb96ade2d6"
  auth_token = "3b36f19066f4220136d2c50e76a8387e"

  @client = Twilio::REST::Client.new account_sid, auth_token

  @message = @client.account.messages.create({:to => send_to,
                                     :from => "(857) 267-5041",
                                     :body => text_content})
  end

end
