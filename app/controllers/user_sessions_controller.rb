class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @usersession = UserSession.new
  end
  
  def create
    @usersession = UserSession.new(params[:user_session])
    
    if @usersession.save
      #redirect_to(root_url, :notice => 'Successfully logged in.')
      flash[:notice] = 'Successfully logged in.'
      redirect_back_or_default root_url
    else
      render :action => "new"
    end
  end
    
  def destroy
    current_user_session.destroy
    
    redirect_to(root_url, :notice => "Successfully logged out.")
  end
end
