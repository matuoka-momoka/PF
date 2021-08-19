# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
    
def inquiry
  inquiry = Inquiry.new(name: "侍 太郎", message: "問い合わせメッセージ")
   InquiryMailer.send_mail(inquiry)
end

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
#----------変更点--------------
      to:   'portfolio0801@gmail.com',
#----------変更点ここまで---------
      subject: 'お問い合わせ通知'
    )
  end

end
