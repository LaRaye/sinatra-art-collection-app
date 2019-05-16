class PaintingsController < ApplicationController
  get '/paintings' do
    @paintings = Painting.all
    erb :'paintings/index'
  end






end
