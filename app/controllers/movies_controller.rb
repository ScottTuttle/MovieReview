class MoviesController < ApplicationController
  load_and_authorize_resource
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  # GET /movies
  def index
  end

  # GET /movies/1
  def show
    @comment = @movie.comments.new
  end

  # GET /movies/new
  def new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  def create
    if @movie.save
      redirect_to(@movie, :notice => 'Movie was successfully added.')
    else
      render :action => "new"
    end
  end

  # PUT /movies/1
  def update
    if @movie.update_attributes(params[:movie])
      redirect_to(@movie, :notice => 'Movie was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy

    flash[:alert] = 'Movie was successfully deleted.'
    redirect_to(movies_url)
  end
end
