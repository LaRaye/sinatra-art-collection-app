class PaintingsController < ApplicationController
  get '/paintings' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    @paintings = Painting.all
    @user = Helpers.current_user(session)
    erb :'paintings/index'
  end

  get '/paintings/new' do
    erb :'paintings/new'
  end

  post '/paintings' do
    if params[:name] != ""
      @painting = Painting.create(params)
    end
    binding.pry
    erb :'paintings/index'
  end



end
