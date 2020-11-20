class RoomsController < ApplicationController
  before_action :authenticate_user, {only:[:new, :show]}
  
  def index
      @rooms = Room.all.order(created_at: :desc)
  end
 
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params,user_id: @current_user.id)
    if @room.save
        redirect_to root_path
        flash[:notice] = "ルームを作成しました。"
    else
        render new_room_path
    end
  end
  
  def show
    @room = Room.find_by(id: params[:id])
  end



private
  def room_params
    params.require(:room).permit(:job_world, :job_contents, :room_condition)
  end
  
  def user_params
    params.permit(:name, :image_name, :email, :password, :password_confirmation)
  end

end