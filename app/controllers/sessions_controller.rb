class SessionsController < ApplicationController

  def new
  end

  def create
    
    # if user exists and password correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save user id inside cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # send back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
