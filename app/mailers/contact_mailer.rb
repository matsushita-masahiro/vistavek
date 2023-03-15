class ContactMailer < ApplicationMailer
  
  def send_when_contact(contact)
    logger.debug("======----------------------- send_when_contact email = #{contact.email}")
    @contact = contact
    mail to:      @contact.email,
    subject: 'Vistavek お問合せ確認'
  end
  
  def send_when_contact_admin(contact)
    logger.debug("======----------------------- send_when_contact admin email = #{ENV['USER_EMAIL']}")
    @contact = contact
    mail to:      ENV['USER_EMAIL'],
    subject: 'Vistavek　お問合せ受信'
  end
  
  def send_when_answer(answer,contact)
    @contact = contact
    logger.debug("======----------------------- send_when_answer email = #{contact.email}")
    @answer = answer
    mail to:      @contact.email,
    subject: 'Vistavek お問合せへのご回答'
  end
  
  def send_when_answer_admin(answer,contact)
    @contact = contact
    @answer = answer
    mail to:      ENV['USER_EMAIL'],
    subject: 'Vistavek　お問合せへの回答'
  end
  
  
  
end
