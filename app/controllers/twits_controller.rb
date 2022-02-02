class TwitsController < ApplicationController
	def index
		@twits=Twit.all
	end

	def new
		@twit=Twit.new
	end

	def show
		@twit=Twit.find(params[:id])
	end

	def create
		@twit= Twit.new(name:"...",body:"...")
		if @twit.save
			redirect_to @twit
		else
			render :new, status: :unprocessable_entity
		end
	end

	#private def twit_params
		#params.require(:twit).permit(:name, :body)
	#end
end
