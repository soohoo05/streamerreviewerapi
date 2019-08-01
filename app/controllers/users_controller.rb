class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode({user_id: user.id}, 'SECRET')
      puts "here"
      render json: {user: {user_id: user.id,name:user.name,username:user.username,email:user.email},reviews:[], jwt: token}
    else
      render json: {error: "WRONG"}, status: 422
    end
  end

def index
  @user= User.all
  render json: {users: @user}
end

def show
  user=User.find_by(username:params[:id])
  reviews=user.reviews
  render json: {user:user,reviews:reviews}
end

def update
 @user = User.find(params[:id])
  @user.update(user_params)

    render json:@user

end

def destroy
user=User.find(params[:id])
user.destroy
end

private
  def user_params
    params.require(:user).permit(:username, :password ,:name, :email,)
  end


end
