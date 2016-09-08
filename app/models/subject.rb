class Subject < ActiveRecord::Base

  # Associations
  has_many :reports

  # Validations
  validates :name, presence: true
end
