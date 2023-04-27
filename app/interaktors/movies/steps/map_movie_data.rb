# frozen_string_literal: true

module Movies
  module Steps
    class MapMovieData
      include Interaktor

      input { required(:movies) }

      success do
        required(:status)
        required(:result)
      end

      def call = success!(status: :ok, result: { movies: map_movies })

      def map_movies = movies['results'].map { map_movie(_1) }

      def map_movie(movie)
        {
          "title": movie['title'],
          "poster_image": movie['poster_path']
        }
      end
    end
  end
end
