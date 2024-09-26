class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order(created_at: :desc).includes(:user, :trackable).page(params[:page])
    Rails.logger.info "Total activities: #{Activity.count}"
    Rails.logger.info "Activities in this query: #{@activities.size}"
  end
end