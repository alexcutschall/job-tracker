class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  before_save :capitalize_name

  def capitalize_name
    if self.name
      self.name = self.name.split.collect(&:capitalize).join(' ')
    end
  end

  def self.top_three
    select("companies.name, avg(jobs.level_of_interest) AS average_interest")
    .joins(:jobs)
    .group(:name)
    .order("average_interest DESC")
    .limit(3)
  end
end
