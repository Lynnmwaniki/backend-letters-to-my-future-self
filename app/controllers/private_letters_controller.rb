class PrivateLettersController < ApplicationController
    def index
        render json: PrivateLetter.all
    end

    def show
        private_letter = PrivateLetter.find_by(id: params[:id])
        if private_letter
            render json: private_letter, include: :user
        else 
            render json: {error: "Letter not found"}, status: :not_found
        end
    end

    def create
        # private_letter = PrivateLetter.create!(private_letter_params)
        # render json: private_letter, status: :created

        ## find user (check if logged in)
        user = User.find_by(id: session[:user_id])
        # if user is logged in
        if user
            private_letter = user.private_letters.create!(private_letter_params)
             # check if private letter is valid
             if private_letter.valid?
                render json: private_letter, include: ["user"], status: :created
            else
                render json: {errors: ["Invalid parameters"]}, status: :unprocessable_entity
            end
        else
              # raise an error
              render json: { errors: ["Not authorized"] }, status: :unauthorized
        end
    end

    

    def destroy
        private_letter = PrivateLetter.find_by(id: params[:id])
        private_letter.destroy
        render json: private_letter, status: :no_content
    end

    private

    def private_letter_params
        params.permit(:text, :date, :user_id)
    end

end
