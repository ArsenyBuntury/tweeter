class CommentsController < ApplicationController
include TwitsComments
  before_action :load_twit!
  
  def create
    @comment = @twit.comments.build(comment_create_params)
    if @comment.save
      flash[:succes] = 'Comment posted!'
      redirect_to twit_path(@twit)

    else
      @comments = @twit.comments.order created_at: :desc

    end
  end

  def show
    @comments = @twit.comments.order created_at: :desc
  end

  def update
    @comment = @twit.comments.find(params[:id])
    if @comment.update(comment_update_params)
      redirect_to twit_path(@twit)
    else
      render :edit
    end
  end

  def destroy
    comment = @twit.comments.find(params[:id]) 
    
    comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to twit_path(@twit)
  end

  private
  
  def comment_create_params
    params.require(:comment).permit(:commenter, :body).merge(user_id: current_user.id)
  end 

  def comment_update_params
    params.require(:comment).permit(:commenter, :body)
  end

  def load_twit!
    @twit = Twit.find(params[:twit_id])
  end
end
