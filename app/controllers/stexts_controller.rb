class StextsController < OpenReadController

 def index
  @ptext = Ptext.find(params[:ptext_id])
  render json: @ptext.stexts.reverse
 end

 def show
  @ptext = Ptext.find(params[:ptext_id])
  render json: Stext.find(params[:id])
 end

 def create
  @ptext = Ptext.find(params[:ptext_id])
  @stext = @ptext.stexts.new(stext_params)
  @stext.user = current_user
  if @stext.save then
    render json: @stext, status: :created
  else
    render json: @stext.errors
  end
 end

 def edit
      @stext = Stext.find(params[:id])
    if @stext.update(stext_params)
      head :no_content
    else
      render json: @stext.errors, status: :unprocessable_entity
    end
 end

 def delete
  @stext = Stext.find(params[:id])
  @stext.destroy
 end

def stext_params
  params.require(:stext).permit(:title, :text, :votes, :ptext_id)
 end

def getVote
  @ptext = Ptext.find(params[:ptext_id])
  @stext = @ptext.stexts.find(params[:id])
  render json: @stext.get_likes.size
end

def upVote
  @stext = Stext.find(params[:id])
  @stext.liked_by current_user
  render json: @stext.get_likes.size
end

end
