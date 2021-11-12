class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
    # definir instance bookmark afin de pouvoir y accéder
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to list_path(@list.path)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
