class Report < ActiveRecord::Base
  validates :name, presence: true
end
