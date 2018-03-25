class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true

  belongs_to :category
  belongs_to :company
  has_many :job_comments
end
