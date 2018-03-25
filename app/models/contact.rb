class Contact < ApplicationRecord
  validates :full_name, :email, :position, presence: true
  belongs_to :company
end
