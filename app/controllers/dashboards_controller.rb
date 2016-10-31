class DashboardsController < ApplicationController
  def index
    @company = Company.new
    @job = Job.new
    @companies = Company.pluck(:city).uniq
  end

end
