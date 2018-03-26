class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true

  belongs_to :category
  belongs_to :company
  has_many :job_comments, dependent: :destroy

  def comments_ordered
    job_comments.order(created_at: :desc)
  end

  def self.sort_by_location
    order(:city)
  end

  def self.sort_by_interest
    order(level_of_interest: :desc)
  end

  def self.top_interest_jobs
    order("level_of_interest DESC")
  end

  def self.number_of_jobs_top_interest_level
    highest_interest_number = self.top_interest_jobs.first.level_of_interest
    where(level_of_interest: highest_interest_number).count
  end

  def self.number_of_jobs_second_interest_level
    second_highest_interest_number = self.top_interest_jobs.first.level_of_interest
    where(level_of_interest: second_highest_interest_number).count
  end

  def self.number_of_jobs_third_interest_level
    third_highest_interest_number = self.top_interest_jobs.first.level_of_interest
    where(level_of_interest: third_highest_interest_number).count
  end
end
