require './config/environment'

class ApplicationController < Sinatra::Base
register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "whooart"
  end

  get "/" do
    erb :index
  end

  def current_user
    User.find(session[:user_id])
  end

  def is_logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    if is_logged_in? == false
      flash[:login_err_2] = 'Sorry, you must be logged in to do that.'
      redirect '/login'
    end
  end
end
