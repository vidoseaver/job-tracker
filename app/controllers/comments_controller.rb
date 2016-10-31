class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    job = Job.find(comment.job_id)
    company = Company.find(job.company_id)
    redirect_to company_job_path(company, job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id )
  end



end
