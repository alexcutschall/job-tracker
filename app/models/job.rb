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
end
