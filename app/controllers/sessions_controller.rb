# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  
  layout "login"
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
      if current_user
        redirect_to(orders_url)
      end
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    if user
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_to(:controller => "orders", :action => "index")
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "Voce está agora deslogado do sistema."
    redirect_to(:controller => 'orders', :action => 'index')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash.now[:error] = "Erro, não posso logar."
    logger.warn "ALERTA: Falha no login para  '#{params[:login]}' ip: #{request.remote_ip} em #{Time.now.utc}"
  end
end
