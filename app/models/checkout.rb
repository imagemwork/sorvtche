class Checkout < ActionMailer::Base

  def order_checkout(user_name)
    
    @user_name = user_name
    
    # AQUI VAO IR OS DADOS DE EMAIL DO VANDE
    @recipients  = "edipofederle@gmail.com"
    @from        =  "edipofederle@gmail.com"
    @subject     = "Sorvtche - "
    @body[:url]  = "--"
  end
    
end
