class SessionsController < ApplicationController
  before_action :go_home_if_logged_in, only: %i[new create]
  before_action :fetch_user, only: [:create]

  def new
    @user = User.new
  end

  def create
    if @user&.authenticate(session_params[:password])
      puts 'Authenticated'
      login @user
      flash[:success] = 'Bienvenido'
      redirect_to root_path
    else
      flash[:error] = 'Por favor verifica tu información e intenta de nuevo'
      render :new
    end
  end

  def destroy
    if logout
      flash[:info] = 'Ha cerrado su sesión'
    else
      flash[:error] = 'No se ha podido cerrar su sesión, por favor intente de nuevo'
    end
    redirect_to login_path
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
  
  def fetch_user
    @user = User.find_by(username: session_params[:username])  
  end
end
