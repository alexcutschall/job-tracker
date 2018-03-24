class JobCommentsController < ApplicationController


  def create
    @job_comment = JobComment.new(job_comment_params)
    @job_comment.job_id = params[:job_id]

    @job_comment.save

    redirect_to company_job_path(@job_comment.job)
  end

  private

  def job_comment_params
    params.require(:comment).permit(:body)
  end
end
