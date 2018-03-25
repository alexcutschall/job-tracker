class JobsController < ApplicationController
  # before_action :set_company [:index, :new, :create, :update]
  before_action :set_job, only: [:edit, :update]

  def index
    # @company = Company.find(params[:company_id])
    @jobs = Job.all
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @job_comment = JobComment.new
    @job_comment.job_id = @job.id
  end

  def edit

  end

  def update
    @job.update(job_params)

    flash.notice = "#{@job.title} was updated!"
    redirect_to company_job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:success] = "#{@job.title} was deleted!"
    redirect_to company_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
