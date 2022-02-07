class CommentsController < ApplicationController
	require 'pry'
	before_action :load_twit!
	  def build
    @comment = @twit.comments.build(comment_params)
    if @comment.save
    	flash[:succes]="Comment posted!"
    	redirect_to twit_path(@twit)

    else
    	flash.now[:danger]="error"
    end	
    
  end

  def show
  	@comments=@twit.comments.order created_at: :desc
  end

  def destroy
  	comment=@twit.comments.find(params[:id])
  	comment.destroy
  	flash[:success]="Comment deleted!"
  	redirect_to twit_path(@twit)
  end
  private def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def load_twit!
  	Twit.find(params[:id])
  end

end
