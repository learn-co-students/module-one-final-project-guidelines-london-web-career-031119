class Api::V1::ListController < ApplicationController
    def index
      list = List.order("created_at DESC")
      render json: {status: 200, data: list}, status: :ok
    end

    def show
      list = List.find_by(params[:id])
      render json: {status: 200, data: list}, status: :ok
    end

    def create
      list = List.new(list_params)
      if list.save
        render json: {status: 200, data: list}, status: :ok
      else
        render json: {status: 500, data: list.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      List.find(params[:id]).destroy
      render json: {status: 200, data: nil, message: "List deleted"}, status: :ok
    end
end
