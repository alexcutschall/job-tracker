class DashboardController < ApplicationController

  def index
    @top_jobs = Job.top_interest_jobs
    @job_count1 = Job.number_of_jobs_top_interest_level
    @job_count2 = Job.number_of_jobs_second_interest_level
    @job_count3 = Job.number_of_jobs_third_interest_level
  end

end
