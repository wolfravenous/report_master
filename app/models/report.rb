class Report < ActiveRecord::Base
  validates :name, presence: true
  validates :comment, presence: true
  validates :gender, presence: true
end
