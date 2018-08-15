class Report < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true
  validates_presence_of :report_date, :report_description, :report_location, :report_title
end
