class MicropostsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
   before_action :correct_user,   only: [:destroy]

  def destroy
    correct_user
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
    
  end

  def show
    @micropost = Micropost.find_by_id params[:id]
    @comment=@micropost.comments.paginate(page: params[:page],per_page: 3)            
  end
 

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'demo_pages/entry'
    end
  end



  private

    def micropost_params
      params.require(:micropost).permit(:content,:title, :picture)
    end

     def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end


end