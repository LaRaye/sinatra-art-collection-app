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
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    erb :'paintings/new'
  end

  post '/paintings' do
    @user = Helpers.current_user(session)
    if params[:name] != ""
      @painting = Painting.create(params)
    end
    redirect '/paintings' #redirect to individual show page?
  end

  get '/paintings/:id' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    @painting = Painting.find_by_id(params[:id])
    erb :'paintings/show'
  end

  get '/paintings/:id/edit' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end

    @painting = Painting.find_by_id(params[:id])
    erb :'/paintings/edit'
  end

  patch '/paintings/:id' do
    @painting = Painting.find_by_id(params[:id])

    if params[:name] != ""
      @painting.name = params[:name]
      @painting.save
    end

    redirect to "/paintings/#{@painting.id}"
  end




end
