class AuthController < ApplicationController

  def create

    user = User.find_by(username: login_user_params[:username])
    if user && user.authenticate(login_user_params[:password])
      token = JWT.encode({user_id: user.id}, 'SECRET')
      reviews=user.reviews
      render json: {user: {user_id: user.id,name:user.name,username:user.username,email:user.email},reviews:reviews, jwt: token}
    else
      render json: {error: "Error with username or password"}, status: 400
    end
  end

  def show
    string = request.authorization
    token = JWT.decode(string, 'SECRET')[0]
    id = token["user_id"].to_i
    @user = User.find(id)
    if @user
      reviews=@user.reviews
      render json: {user: {user_id: @user.id,name:@user.name,username:@user.username,email:@user.email},reviews:reviews}
    else
      render json: {error: "Incorrect Username and password combination"}, status: 422
    end
  end

private

 def login_user_params
   params.require(:user).permit(:username, :password)
 end


end
