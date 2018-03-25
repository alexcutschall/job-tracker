class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update]

  def index
    if params[:location]
      @jobs = Job.where(city: params[:location])
      render partial: "location"
    elsif params[:category]
      @jobs = Job.where(category_id: params[:category])
      render partial: "category"
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.create!(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@job.company.name}"
      redirect_to jobs_path
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
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
