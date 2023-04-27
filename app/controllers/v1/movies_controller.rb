# frozen_string_literal: true

module V1
  class MoviesController < ApplicationController
    skip_before_action :authorize_request

    def index
      json_interactor_response(Movies::UseCase::GetMovies.call(query: movie_params[:query]))
    end

    def movie_params = params.permit(:query)
  end
end
