class WikisController < ApplicationController
  def index
    if current_user.present?
      @user = current_user
      if params[:select]=="collab"
        @wikis = policy_scope(@user.cowikis)
      elsif params[:select]=="all"      
        @wikis = policy_scope(Wiki)
      else
        @wikis = policy_scope(@user.wikis)
      end
    else
      @wikis = policy_scope(Wiki)
    end

  end

  def privatize
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.hide ? @wiki.hide = false : @wiki.hide = true
    if @wiki.save
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      redirect_to @wiki
    end
  end

  def collaborations

  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @users = @wiki.users
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
     @user = current_user
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     @users= @wiki.users
  end

 def update
   @user = current_user
   @wiki = Wiki.find(params[:id])
   authorize @wiki
   if @wiki.update_attributes(wiki_params)
     # flash[:notice] = "Wiki was updated."
     render :edit
   else
     flash[:error] = "There was an error saving the wiki. Please try again."
     render :edit
   end
 end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    title = @wiki.title

    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

   def wiki_params
     params.require(:wiki).permit(:title, :body, :hide)
   end
end
