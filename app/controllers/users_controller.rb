class UsersController < ApplicationController
 
  def index
    @users = User.all.order(created_at: :desc) 
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    
        # if params[:image_name]
        # @user.image_name = "#{@user.id}.jpg"
        # image = params[:image_name]
        # File.binwrite("public/user_images/#{@user.image_name}", image.read)
        # end 
       
        if @user.save
          session[:user_id] = @user.id
          flash[:notice] = "ユーザー登録が完了しました"
          redirect_to root_path
        
        else
          render :new
        end
  end
  
  
    
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def login_form
    @user = User.new
  end
  
  def login
    # @user = User.find_by(email: params[:email], password: params[:password])
    @user = User.find_by(login_params)
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render :login_form
    end
  end
  
  
  
private
  def user_params
    params.require(:user).permit(:name, :image_name, :email, :password, :password_confirmation)
  end
  
  def login_params
    params.require(:user).permit(:email, :password)
  end
  
end
