class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :index]
    before_action :correct_user, only: :destroy

    def index 
        @feed_items =  Microposts.feed_items.all
    end

    def create
        @micropost = current_user.microposts.build(micropost_params)
        @micropost.image.attach(params[:micropost][:image])
        if @micropost.save
            flash[:success] = "Micropost created!"
            @feed_items =  current_user.feed.page params[:page]
            redirect_to request.referrer
        else
            
            flash[:danger] = "Micropost wasn't created! Probably it was empty or image has invalid format/size"
            redirect_to request.referrer
        end
    end

    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted!"
        redirect_to request.referrer 
    end

    private

    def micropost_params
        params.require(:micropost).permit(:content, :image)
    end

    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to home_path if @micropost.nil?
    end
end
