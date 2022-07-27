class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spice = find_spices
        render json: spice
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    def update
        spice = find_spices
        spice.update(spice_params)
        render json: spice, status: 201
    end

    def destroy
        spice = find_spices
        spice.destroy
        # head: no-content
    end
end

private

def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
end

def find_spices
    Spice.find_by(id: params[:id])
end