class Api::V1::CharactersController < ApplicationController

    #GET /characters
    def index
        @characters = Character.all
        render json: @characters
    end
end
