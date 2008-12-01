class SessionController < ApplicationController
  
  def new
    
  end
  
  def create
    self.current_user = User.find_by_last_name_and_password(params[:user][:name], params[:user][:password])
    session[:user] = current_user
    redirect_to current_user
  end
  
  def destroy
    self.current_user = nil
    session[:user] = nil
    redirect_to login_path
  end
end
