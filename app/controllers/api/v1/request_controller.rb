class Api::V1::RequestController < ApplicationController

  before_action :find_city

  def cities
    cities = City.all
    render json: cities, only: [:name, :id]
  end

  def cinemas
    find_city
    render json: @city.cinemas, only: [:name]
  end

  def movies
    render json: @city.movies, only: [:name]
  end

  private
  def find_city
    @city = City.find(params[:id])
  end
end
