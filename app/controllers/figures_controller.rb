class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])

    if !!params["landmark"]["name"]
      landmark = Landmark.create(params["landmark"])
      @figure.landmarks << landmark
    end

    if !!params["title"]["name"]
      title = Title.create(params["title"])
      @figure.titles << title
    end

    redirect("/figures/#{@figure.id}")
  end

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end

  post '/figures/:id' do #edits figure
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @figure.save

    if !!params["landmark"]["name"]
      landmark = Landmark.create(params["landmark"])
      @figure.landmarks << landmark
    end

    if !!params["title"]["name"]
      title = Title.create(params["title"])
      @figure.titles << title
    end
    
    redirect("/figures/#{@figure.id}")
  end
end
