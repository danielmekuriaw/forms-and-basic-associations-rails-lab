class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.artist_name = params.require("song").permit(:artist_name)["artist_name"]
    @song.genre_type = params.require("song").permit(:genre_id)["genre_id"]
    @song.notes_1 = params.require("song").permit(:notes_1)["notes_1"]
    @song.notes_1 = params.require("song").permit(:notes_2)["notes_2"]

    
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :song_artist_name)
  end
end

