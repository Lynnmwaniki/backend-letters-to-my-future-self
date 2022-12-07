class SessionsController < ApplicationController
#Handle login by implementing a `POST /login` route.
def create
    user = User.find_by(name: params[:name]);
    if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :created
    else
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
end

#Handle logout by implementing a `DELETE /logout` route.
def destroy
    user = User.find_by(id: session[:user_id])
    if user
        session.delete :user_id
    head :no_content
    else
        render json: {errors: ["Not authorized"]}, status: :unauthorized
    end
end

end
