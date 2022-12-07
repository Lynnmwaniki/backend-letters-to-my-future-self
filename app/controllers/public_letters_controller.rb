class PublicLettersController < ApplicationController
    def index
        render json: PublicLetter.all
    end

    def show
        public_letter = PublicLetter.find_by(id: params[:id])
        if public_letter
            render json: public_letter, include: :user
        else 
            render json: {error: "Letter not found"}, status: :not_found
        end
    end


    def increment_likes

    end

    def increment_views

    end

    
end
