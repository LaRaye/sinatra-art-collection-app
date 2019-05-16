class UserController < ApplicationController
  get '/signup' do
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

  end 

end
