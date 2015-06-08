class PtextsController < OpenReadController

 def index
  render json: Ptext.all
 end

 def show
  render json: Ptext.find(params[:id])
 end

 def create
  @ptext = current_user.ptexts.new(ptext_params)
  if @ptext.save then
    render json: @ptext, status: :created
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

 def destroy
  @ptext = Ptext.find(params[:id])
  render json: @ptext
  @ptext.destroy

 end

 def ptext_params
  params.require(:ptext).permit(:title, :history, :text, :user_id)
 end

end
