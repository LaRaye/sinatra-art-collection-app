class UserController < ApplicationController
  get '/signup' do
    if is_logged_in?
      redirect '/art'
    end
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username] != "" && params[:password] != ""
      @user = User.create(:username => params[:username], :password => params[:password])

      session[:user_id] = @user.id
      redirect "/art"
    else
      flash[:signup_err] = 'Please enter a valid username and password to sign up.'
      redirect "/signup"
    end
  end

  get '/login' do
    if is_logged_in?
      redirect '/art'
    end
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/art'
    else
      flash[:login_err_1] = 'Sorry, that login is invalid. Please try again or create an account.'
      redirect '/login'
    end
  end

  get '/art' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'users/art'
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      flash[:logout_message] = 'You have just logged out.'
      redirect to '/'
    else
      flash[:login_err_2] = 'Sorry, you must be logged in to do that.'
      redirect to '/'
    end
  end
end
