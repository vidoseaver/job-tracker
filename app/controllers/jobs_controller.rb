class JobsController < ApplicationController
  def index
    @company = Company.find(company_id)
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(company_id)
    @job = Job.new()
  end

  def create
    @company = Company.find(company_id)
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(job_id)
  end

  def edit
    @company = Company.find(company_id)
    @job = Job.find(job_id)
  end

  def update
    @job = Job.find(job_id)
    @job.update_attributes(job_params)
    redirect_to company_job_path(company_id, job_id)
  end

  def destroy
    @job = Job.find(job_id)
    @job.destroy
    @company = Company.find(company_id)
    redirect_to company_jobs_path
  end

  private

  def job_id
    params[:id]
  end

  def company_id
    params[:company_id]
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest)
  end
end
