class UserMailer < ActionMailer::Base
  default :from => "leah@lofirefly.com"
 
  def contact(inquiry)
    @inquiry = inquiry
    mail(:subject => "Firefly Contact",
    	   :to      => "leah@lofirefly.com",
    	   :bcc     => "matthew.j.oconnell1@gmail.com",
    	   :from    => "#{@inquiry.email}")
  end
 
end
