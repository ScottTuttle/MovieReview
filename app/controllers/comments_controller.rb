class CommentsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :require_user, :only => [:create, :edit, :update, :destroy]
  before_filter :load_movie
  
  def new
  end
  
  def edit
  end

  def create
    @comment.movie = @movie
    @comment.user = current_user

    if @comment.save
      redirect_to(@movie, :notice => 'Comment was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to(@movie, :notice => 'Comment was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment.destroy

    redirect_to(@movie)
  end
  
  def load_movie
    @movie = Movie.find(params[:movie_id])
  end
end
