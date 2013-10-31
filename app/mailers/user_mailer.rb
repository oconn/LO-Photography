class UserMailer < ActionMailer::Base
  default :from => "leah@lofirefly.com"
 
  def contact(inquiry)
    @inquiry = inquiry
    mail(:subject => "Firefly Contact",
    	   :to      => "matthew.j.oconnell1@gmail.com")
  end
 
end
