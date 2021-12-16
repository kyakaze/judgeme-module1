class MoviesController < ApplicationController

  def index
    begin
      res = RestClient.get "https://api.themoviedb.org/3/movie/popular",
                           { params: {
                             api_key: ENV['MOVIE_API_KEY'],
                             page: 1
                           }}
      data = JSON.parse(res.body, symbolize_names: true)
      @movies = data[:results]
      # @page = data[:page]
    rescue => e
      puts e, "-----"
      render "layouts/404" and return
    end
  end

  def show
    begin
      res = RestClient.get("https://api.themoviedb.org/3/movie/#{params[:id]}" , { params: { api_key: ENV['MOVIE_API_KEY'] }})
      @movie = JSON.parse(res.body, symbolize_names: true)
    rescue => e  # catch all exceptions includes: network error, response err, json parse exception
      puts e, "-----"
      render "layouts/404" and return
    end
    # render "show"
  end

end
