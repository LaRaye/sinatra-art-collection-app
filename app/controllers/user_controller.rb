class UserController < ApplicationController
  get '/signup' do
    # if Helpers.is_logged_in?(session)
    #   redirect '/'
    # end
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :password => params[:password])

    if @user.save && params[:username] != ""
      session[:user_id] = @user.id
      redirect "/" ###
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
      redirect '/' ###
    else
      redirect '/login' ###create failure
    end
  end

end
