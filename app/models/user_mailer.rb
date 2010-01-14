class UserMailer < ActionMailer::Base
  
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Seu cadastro foi realizado com sucesso.'
    @body[:url]  = "--"
  end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "edipofederle@gmail.com"
      @subject     = "Sorvtche - "
      @sent_on     = Time.now
      @body[:user] = user
    end
    
end
