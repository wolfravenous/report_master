class Report < ActiveRecord::Base

  # Associations
  belongs_to :subject

  # Validations
  validates :name, presence: true
  validates :comment, presence: true
  validates :gender, presence: true
  validates :subject_id, presence: true


end
