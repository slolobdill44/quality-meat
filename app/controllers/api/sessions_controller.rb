class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])

    if @user
      login!(@user)
      render '/api/users/show'
    else
      render json: ["Invalid username/password combination"], status: 401
    end
  end

  def destroy
    @user = current_user
    if @user
      logout!
      render '/api/users/show'
    else
      render json: ["No one is signed in"], status: 404
    end
  end

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
