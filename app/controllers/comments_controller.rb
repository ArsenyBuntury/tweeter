class CommentsController < ApplicationController
	def create
		@twit=Twit.find(params[:id])
		@comment=@twit.comments.create(comment_params)
		redirect_to twit_path(@twit)
	end

	private def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
