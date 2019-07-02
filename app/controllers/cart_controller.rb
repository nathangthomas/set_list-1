class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def add_song
    song = Song.find(params[:song_id])
    cart = Cart.new(session[:cart])
    cart.add_song(song.id)
    session[:cart] = cart.contents
    flash[:success] = "You now have #{pluralize(cart.song_count(song.id), 'copy')} of #{song.title} in your cart."
    redirect_to songs_path
  end
end
