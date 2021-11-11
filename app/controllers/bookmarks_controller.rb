class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])

  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = @bookmark.list_id
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path(@bookmark.path)
  end

  private

  def bookmark_params
    params.require(:list).permit(:comment, :movie_id, :list_id)
  end

end
