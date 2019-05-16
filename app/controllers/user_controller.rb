class UserController < ApplicationController
  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/art'
    end
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username] != "" && params[:password] != ""
      @user = User.create(:username => params[:username], :password => params[:password])

      session[:user_id] = @user.id
      redirect "/art" ###
    else
      redirect "/signup" ###create failure
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/art' ###
    else
      redirect '/login' ###create failure
    end
  end

  get '/art' do
    erb :'users/art'
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
