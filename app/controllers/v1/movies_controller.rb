# frozen_string_literal: true

module V1
  class MoviesController < ApplicationController
    skip_before_action :authorize_request

    require 'uri'
    require 'net/http'

    def map_movies(movie_arr) = movie_arr['results'].map{ map_movie(_1) }

    def index
     api_key ="a99cc60fc2b34dbb18cb806b8a88ed14"
     #query = "Star Wars"

     uri = URI("https://api.themoviedb.org/3/search/movie?query='#{params[:query]}'&language=en-US&page=1&include_adult=false&api_key=#{api_key}")

     res = Net::HTTP.get_response(uri)
     data = JSON.parse(res.body)

     render json: { "movies": map_movies(data)}
    end

    def map_movie(movie)
      {
        "title": movie["title"],
        "poster_image": movie["poster_path"]
      }
    end
  end
end
