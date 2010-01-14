class OrdersController < ApplicationController
    include AuthenticatedSystem
    before_filter :login_required
    
    layout "private"
    def index
      @users = User.all
    end
end
