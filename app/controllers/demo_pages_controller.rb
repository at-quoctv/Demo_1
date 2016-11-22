class DemoPagesController < ApplicationController
 def entry

    # @micropost = current_user.microposts.build if logged_in?  

      if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def show
   @micropost = Micropost.paginate(page: params[:page])
  @comment = Micropost.paginate(page: params[:page]) 
  end


end
