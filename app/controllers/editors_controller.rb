class EditorsController < ApplicationController

  def create
    @users = User.all
    @wiki = Wiki.find params[:id]
    if params.has_key?(:editselect)
      params[:editselect].each do |u_id|
        u = User.find params[:id]
        join = Editor.u.@wiki.new
        join.save
      end
    else
      flash[:error] = 'Please select an editor'
      redirect_to edit_wiki_path  
    end  
  end

  def complete

  end

  def update
    flash[:error] = 'Update editors'
  end
end
