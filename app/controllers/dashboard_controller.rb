class DashboardController < ApplicationController

  def index
    @top_jobs = Job.top_interest_jobs
    @job_count = Job.number_of_jobs_by_interest_level
  end

end