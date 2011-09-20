class PagesController < ApplicationController
  def show
    @posts = Post.all
    @navigation = Navigation.new(params[:id])
    render("posts/index")
  end
end
