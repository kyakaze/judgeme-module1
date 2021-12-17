class MoviesController < ApplicationController

  def index
    trending = !params[:trending].nil? ? params[:trending] : "popular"
    page = !params[:page].nil? ? params[:page] : 1
    begin
      res = RestClient.get "https://api.themoviedb.org/3/movie/#{trending}",
                           { params: {
                             api_key: ENV['MOVIE_API_KEY'],
                             page: page
                           }}
      data = JSON.parse(res.body, symbolize_names: true)

      @movies = data[:results]
     @page = data[:page]
      @total_page = data[:total_pages]
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

  # route to handle search request and return search result
  def search
    if params[:query].nil?
      redirect_to  root_url and return
    end
    page = !params[:page].nil? ? params[:page] : 1

    begin
      res = RestClient.get("https://api.themoviedb.org/3/search/movie#{params[:id]}" ,
                           { params: {
                             api_key: ENV['MOVIE_API_KEY'],
                             query: params[:query],
                             page: page
                           }})
      data = JSON.parse(res.body, symbolize_names: true)
      @movies = data[:results]
      @page = data[:page]
      @total_page = data[:total_pages]
    rescue => e  # catch all exceptions includes: network error, response err, json parse exception
      puts e, "-----"
      render "layouts/404" and return
    end
    # simple_form

  end


end
