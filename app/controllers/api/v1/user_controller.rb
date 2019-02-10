module Api::V1
  class UserController < ApplicationController
    def index
      @users = User.order(id: :desc)
      render(json: @users, status: 200) && return if @users.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end

    def show
      @user = User.find(params[:id])
      render(json: 'Not found', serializer: ErrorSerializer, status: 404) && return unless @user.present?
      render(json: @user, status: 200)
    end

    def create
      @user = User.create(permitted_params)
      render(json: @user, status: 201) && return if @user.save
      render(json: 'Error', serializer: ErrorSerializer, status: 400)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render(json: @user, status: 200)
    end

    def update
      @user = User.find(params[:id])
      render(json: @user, status: 200) && return if @user.update_attributes(permitted_params)
      render(json: 'User not update', serializer: ErrorSerializer, status: 400)
    end

    private

    def permitted_params
      params.permit(:name, :email, :password)
    end
  end  
end