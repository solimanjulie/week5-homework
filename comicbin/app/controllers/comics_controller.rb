class ComicsController < ApplicationController

  def index
    @comics = Comic.all.order("title asc")
  end

  def show
    id = params["comic_id"]
    @comic = Comic.find_by :id => id
    render 'show'
  end

  def toast
    id = params["comic_id"]
    c = Comic.find_by :id => id
    c.destroy
    redirect_to "/comics"
  end

  def new
    # renders new.html.erb
  end

  def create
    c = Comic.new
    c.title = params["title"]
    c.description = params["description"];
    c.image_url = params["image_url"];
    c.save
    redirect_to "/comics"
  end

end
