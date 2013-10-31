class UserMailer < ActionMailer::Base
  default :from => "leah@lofirefly.com"
 
  def contact(inquiry)
    @inquiry = inquiry
    mail(:subject => "Firefly Contact")
  end
 
end
