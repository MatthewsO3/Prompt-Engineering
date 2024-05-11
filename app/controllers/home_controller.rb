class HomeController < ApplicationController
  def index
 
  end
  def info
  end
  def films
  @movies = Movie.all
  end
  def edit
  @movie = Movie.find(params[:id])
  end
end
