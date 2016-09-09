class Subject < ActiveRecord::Base

  # Associations
  # The dependent restriction prevents subjects from being deleted that contain reports
  has_many :reports, dependent: :restrict_with_error

  has_many :units, dependent: :delete_all

  # Validations
  validates :name, presence: true
end
