class SculpturesController < ApplicationController
  get '/sculptures' do
    redirect_if_not_logged_in
    @sculptures = Sculpture.all
    @user = current_user
    erb :'sculptures/index'
  end

  get '/sculptures/new' do
    redirect_if_not_logged_in
    erb :'sculptures/new'
  end

  post '/sculptures' do
    @user = current_user
    if params[:name] != ""
      @sculpture = Sculpture.create(params)
      @sculpture.user_id = @user.id
      @sculpture.save

      redirect to "/sculptures/#{@sculpture.id}"
    else
      flash[:name_err] = 'Sorry, you must include a name to add to your collection.'
      redirect '/sculptures/new'
    end
  end

  get '/sculptures/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @sculpture = Sculpture.find_by_id(params[:id])

    if @sculpture.user_id == @user.id
      erb :'sculptures/show'
    else
      redirect '/sculptures'
    end
  end

  get '/sculptures/:id/edit' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @sculpture = Sculpture.find_by_id(params[:id])
    @sculpture.delete
    flash[:deletion] = 'Successfully removed piece from your collection.'
    redirect '/sculptures'
  end
end
