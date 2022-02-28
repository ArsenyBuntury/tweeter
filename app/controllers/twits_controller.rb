class TwitsController < ApplicationController
include TwitsComments
  before_action :load_twit!, only: %w[show edit update destroy]
  before_action :fetch_tags, only: %i[new edit]

  def index
    @twits = Twit.order(created_at: :desc).all_by_tags(params[:tag_ids]).page params[:page]
    @tags = Tag.all
  end

  def new
    @twit = Twit.new
  end

  def show
    @comment = @twit.comments.build
    @comments = @twit.comments.order(created_at: :desc).page params[:page]
  end

  def create
    @twit = current_user.twits.build(twit_params)
    flash[:success]="Success!"
    if @twit.save
      redirect_to @twit
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @twit.update(twit_params)
      redirect_to @twit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @twit.destroy
    redirect_to twits_path, status: :see_other
  end

  private 

  def twit_params
    params.require(:twit).permit(:name, :body, tag_ids: [])
  end

  def load_twit!
    @twit = Twit.find(params[:id])
  end

  def fetch_tags
    @tags= Tag.all
  end
end
