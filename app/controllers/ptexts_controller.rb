class PtextsController < ApplicationController

 def index
  render json: Ptext.all
 end

 def show
  render json: Ptext.find(params[:id])
 end

 def create
  @ptext = Ptext.new(ptext_params)
  if @ptext.save then
    render json: @pstext, status: :created
  else
    render json: @ptext.errors
  end
 end

 def edit
      @ptext = Ptext.find(params[:id])
    if @ptext.update(ptext_params)
      head :no_content
    else
      render json: @ptext.errors, status: :unprocessable_entity
    end
 end

 def delete
  @ptext = Ptext.find(params[:id])
  @ptext.destroy
 end

 def ptext_params
  params.require(:ptext).permit(:title, :history, :text, :user_id)
 end

end
