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

    params.each do |k, v|
      if k == 'name' && v != ""
        @painting.name = v
      elsif k == 'artist' && v != ""
        @painting.artist = v
      elsif k == 'date' && v != ""
        @painting.date = v
      elsif k == 'description' && v != ""
        @painting.description = v
      elsif k == 'style' && v != ""
        @painting.style = v
      end
      @painting.save
    end
    redirect to "/paintings/#{@painting.id}"
  end

  delete '/paintings/:id/delete' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    @painting = Painting.find_by_id(params[:id])
    @painting.delete
    redirect '/paintings'
  end


end
