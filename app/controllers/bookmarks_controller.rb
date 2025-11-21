class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]


  def new
    # @list ici est commenté puisqu'on utilise le callback, ligne 2
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # @list ici est commenté puisqu'on utilise le callback, ligne 2
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "new", status: :unprocessable_entity
    end
  end


  def destroy
    # A FAIRE
  end

  private

  def set_bookmark
    # A FAIRE éventuellement
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    # Bookmark a 3 colonnes : comment, list_id et movie_id. On a déjà list_id grâce à la ligne 15. J'ai donc besoin de
    # permettre: comment et movie_id
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
