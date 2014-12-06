class CollaborationsController < ApplicationController

  def create

  end

  def index
    @user = current_user
    @wiki = Wiki.find(params[:wiki_id])
    @collaborations = @wiki.collaborations
    @users = @wiki.users
    @userlist = User.all
  end

  def update
    
  end

  def change
    @wiki = Wiki.find(params[:wiki_id])
    @users = @wiki.users
    @uids = @users.pluck(:id)

    if params.has_key?(:collaborate)
      params[:collaborate].each do |cms|

        cm = cms.to_i
pry
        unless @uids.include?(cm)
          c = Collaboration.new
          c.user_id = cm
          c.wiki_id = @wiki.id
          if c.save
            redirect_to edit_wiki_path(@wiki)
          else
            flash[:error] = 'There was an error'
          end
        end
      end
    end
  end
end