class JobCommentsController < ApplicationController


  def create
    @job_comment = JobComment.new(job_comment_params)
    @job_comment.job_id = params[:job_id]

    @job_comment.save

    redirect_to job_path(Job.find(params[:job_id]))
  end

  private

  def job_comment_params
    params.require(:job_comment).permit(:body)
  end
end
