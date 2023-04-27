# frozen_string_literal: true

module Movies
  module UseCase
    class GetMovies
      include Interaktor::Organizer

      input { required(:query) }

      organize Movies::Steps::QueryMovieApi,
               Movies::Steps::MapMovieData
    end
  end
end
