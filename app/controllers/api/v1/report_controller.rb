module Api::V1
  class ReportController < ApplicationController
    def index
      @reports = Report.order(id: :desc)
      render(json: @reports, status: 200) && return if @reports.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end

    def show
      @report = Report.find(params[:id])
      render(json: @report, status: 200) && return if @report.present?
      render(json: 'Not found', serializer: ErrorSerializer, status: 404)
    end

    def create
      @report = Report.create(permitted_params)
      render(json: @report, status: 201) && return if @report.save
      render(json: 'Error', serializer: ErrorSerializer, status: 400)
    end

    def destroy
      @report = Report.find(params[:id])
      @report.destroy
      render(json: @report, status: 200)
    end

    def update
      @report = Report.find(params[:id])
      render(json: @report, status: 200) && return if @report.update_attributes(permitted_params)
      render(json: 'Report not update', serializer: ErrorSerializer, status: 400)
    end

    private

    def permitted_params
      params.permit(:user_id, :comment_id)
    end
  end  
end