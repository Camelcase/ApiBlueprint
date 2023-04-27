# frozen_string_literal: true

module Movies
  module Steps
    class QueryMovieApi
      include Interaktor

      require 'uri'
      require 'net/http'

      input { required(:query).filled(:string) }

      success { required(:movies) }

      failure do
        required(:result)
        required(:status)
      end

      def call
        api_key = 'a99cc60fc2b34dbb18cb806b8a88ed14'
        uri = URI("https://api.themoviedb.org/3/search/movie?query='#{query}'&language=en-US&page=1&include_adult=false&api_key=#{api_key}")

        begin
          res = Net::HTTP.get_response(uri)
          success!(movies: JSON.parse(res.body))
        rescue StandardError
          fail!(status: :bad_request, result: { status: 'Movie API Error' })
        end
      end
    end
  end
end
