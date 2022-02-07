class TwitsController < ApplicationController
	require 'pry'

	before_action :load_twit!, only: %w(show edit update destroy)
  def index
    @twits = Twit.all
  end

  def new
    @twit = Twit.new
  end

  def show
    @twit = load_twit!
    @comment=@twit.comments.build
    @comments=Comment.order created_at: :desc
  end

  def create
    @twit = Twit.new(twit_params)
    if @twit.save
      redirect_to @twit
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @twit = load_twit!
  end

  def update
    @twit = load_twit!

    if @twit.update(twit_params)
      redirect_to @twit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    
    @twit = load_twit!
    @twit.destroy

    redirect_to twits_path, status: :see_other
  end

  private def twit_params
    params.require(:twit).permit(:name, :body)
  end

  def load_twit!
  	Twit.find(params[:id])
  end
end
