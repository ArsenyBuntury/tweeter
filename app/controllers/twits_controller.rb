class TwitsController < ApplicationController
  def index
    @twits = Twit.all
  end

  def new
    @twit = Twit.new
  end

  def show
    @twit = Twit.find(params[:id])
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
    @twit = Twit.find(params[:id])
  end

  def update
    @twit = Twit.find(params[:id])

    if @twit.update(twit_params)
      redirect_to @twit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    binding.irb
    @twit = Twit.find(params[:id])
    @twit.destroy

    redirect_to twits_path
  end

  private def twit_params
    params.require(:twit).permit(:name, :body)
  end
end
