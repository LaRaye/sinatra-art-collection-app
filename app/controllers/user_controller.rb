class UserController < ApplicationController
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    params.inspect
  end
end
