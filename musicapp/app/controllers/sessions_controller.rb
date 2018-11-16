class SessionsController < ApplicationController

  before_action :require_login, except: [:create, :new]

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def new
    render :new
  end

end
