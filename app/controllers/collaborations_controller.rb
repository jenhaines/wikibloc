class CollaborationsController < ApplicationController

  def create
    @users = User.all
    @wiki = Wiki.find(params[:wiki_id])

    if params.has_key?(:editselect)
      params[:editselect].each do |i|
        u = User.find_by_id(i)
        join = Wiki.editors.u.new
        join.save
      end
    else
      flash[:error] = 'Please select an editor'
      redirect_to edit_wiki_path  
    end  
  end

  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborations = @wiki.users
  end

  def complete

  end

  def update
    flash[:error] = 'Update editors'
  end
end
