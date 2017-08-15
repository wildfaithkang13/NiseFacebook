class NoticeMailer < ApplicationMailer
  def sendmail_facebook(facebook)
    #@greeting = "Hi"
    @facebook = facebook
    mail to: @facebook.user.email,
          subject: 'NiseFacebookに投稿されました'
  end
end
