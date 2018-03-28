class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true

  belongs_to :category
  belongs_to :company
  has_many :job_comments, dependent: :destroy

  before_save :capitalize_title, :capitalize_city

  def capitalize_title
    if self.title
      self.title = self.title.split.collect(&:capitalize).join(' ')
    end
  end

  def capitalize_city
    if self.city
      self.city = self.city.split.collect(&:capitalize).join(' ')
    end
  end

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
    select(:level_of_interest)
    .distinct
    .order("level_of_interest DESC")
    .take(3)
  end

  def self.number_of_jobs_by_interest_level
    order(:level_of_interest)
    .group(:level_of_interest)
    .count
  end

  def self.count_by_location
    group(:city).count
  end
end
