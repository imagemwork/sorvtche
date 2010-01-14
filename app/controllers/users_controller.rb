class UsersController < ApplicationController
  #Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  before_filter :login_required, :except => [:new, :create]
  
  layout "private"
  
  def index
    @users = User.all
  end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_to(new_session_path)
      flash[:notice] = "Agradeçemos o seu cadastro, um email foi enviado para sua caixa postal contendo as informações de login e senha."
    else
      render :action => 'new'
    end
  end
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
     respond_to do |format|
       if @user.update_attributes(params[:user])
         format.html { redirect_to(@user) }
         format.js
       else
          format.html { render :action => "edit" }
          format.js
       end
     end
  end
  
  def show_form_edit
    respond_to do |format|
      format.js
    end
  end
  
    
  def show
    current = User.find(params[:id])
   	if current_user.is_admin == true
    	@user = current
		else
		    if user_current(:content_method => :login) == current.login
      @user = current
	    else
	      render :template => "users/error_access"
	      logger.warn "ALERTA: O Usuario #{current.login} tentou acessasr outras contas."
	    end
    end

  end
  
  def admin_show
    if current_user.is_admin == true
    	@user = User.find(params[:id])
		else
			render :text => "nao pode"
		end
  end


  protected
  def user_current(user)
    if current_user
      current =  current_user.login
      return current
    end
  end

end
