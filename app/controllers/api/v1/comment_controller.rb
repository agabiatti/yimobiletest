module Api::V1
  class CommentController < ApplicationController
    def index
      @comments = Comment.order(id: :desc)
      render(json: @comments, status: 200) && return if @comments.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end

    def show
      @comment = Comment.find(params[:id])
      render(json: @comment, status: 200) && return if @comment.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end

    def create
      @comment = Comment.create(permitted_params)
      render(json: @comment, status: 201) && return if @comment.save
      render(json: 'Error', serializer: ErrorSerializer, status: 400)
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      render(json: @comment, status: 200)
    end

    def update
      @comment = Comment.find(params[:id])
      render(json: @comment, status: 200) && return if @comment.update_attributes(permitted_params)
      render(json: 'Comment not update', serializer: ErrorSerializer, status: 400)
    end

    def without_comment_reported
      @comments = Comment.without_reported
      render(json: @comments, status: 200) && return if @comments.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end

    def reported_comments
      @reported_comments = Comment.reported
      render(json: @reported_comments, status: 200) && return if @reported_comments.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end
    
    private

    def permitted_params
      params.permit(:text, :user_id, :event_id)
    end
  end  
end