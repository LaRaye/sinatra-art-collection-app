class SculpturesController < ApplicationController
  get '/sculptures' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    @sculptures = Sculpture.all
    @user = Helpers.current_user(session)
    erb :'sculptures/index'
  end

  get '/sculptures/new' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    erb :'sculptures/new'
  end

  post '/sculptures' do
    @user = Helpers.current_user(session)
    if params[:name] != ""
      @sculpture = Sculpture.create(params)
      @sculpture.user_id = @user.id
      @sculpture.save

      redirect to "/sculptures/#{@sculpture.id}"
    else
      redirect '/sculptures/new'
    end

  end

  get '/sculptures/:id' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    @user = Helpers.current_user(session)
    @sculpture = Sculpture.find_by_id(params[:id])
    erb :'sculptures/show'
  end

  get '/sculptures/:id/edit' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end

    @sculpture = Sculpture.find_by_id(params[:id])
    erb :'/sculptures/edit'
  end

  patch '/sculptures/:id' do
    @sculpture = Sculpture.find_by_id(params[:id])

    params.each do |k, v|
      if k == 'name' && v != ""
        @sculpture.name = v
      elsif k == 'artist' && v != ""
        @sculpture.artist = v
      elsif k == 'date' && v != ""
        @sculpture.date = v
      elsif k == 'description' && v != ""
        @sculpture.description = v
      elsif k == 'style' && v != ""
        @sculpture.style = v
      end
      @sculpture.save
    end
    redirect to "/sculptures/#{@sculpture.id}"
  end

  delete '/sculptures/:id/delete' do
    if Helpers.is_logged_in?(session) == false
      redirect '/login'
    end
    @sculpture = Sculpture.find_by_id(params[:id])
    @sculpture.delete
    redirect '/sculptures'
  end
end
