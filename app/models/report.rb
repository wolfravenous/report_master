class Report < ActiveRecord::Base

  # Associations
  belongs_to :subject
  belongs_to :unit
  belongs_to :intro
  belongs_to :future

  belongs_to :initial, class_name: "Unit"

  # Validations
  validates :name, presence: true
  validates :comment, presence: true
  validates :gender, presence: true
  validates :subject_id, presence: true
  validates :intro_id, presence: true
  validates :unit_id, presence: true
  validates :initial_id, presence: true
  validates :future_id, presence: true
  validates :classwork, presence: true
  validates :assessment, presence: true
  validates :participate, presence: true


  # Callbacks
  def favg
    (self.classwork.to_f * 0.5) + (self.assessment.to_f * 0.3) + (self.participate.to_f * 0.2) + (0.5)
  end

  def average
    favg.to_i
  end

end
