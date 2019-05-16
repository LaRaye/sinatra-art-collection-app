class PaintingsController < ApplicationController
  get '/paintings' do
    # Helpers.redirect_if_not_logged_in(session)
    @paintings = Painting.all
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
