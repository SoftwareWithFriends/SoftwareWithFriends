class PagesController < ApplicationController
  def show
    page = params[:id]
    subjects = Subject.by_name_with_children(page)
    @posts = Post.by_subjects(subjects)
    @navigation = Navigation.new(page)
    render("posts/index")
  end

end
