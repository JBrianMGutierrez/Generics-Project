class Accomplishment < ApplicationRecord
  belongs_to :profile
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
