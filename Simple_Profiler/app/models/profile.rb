class Profile < ApplicationRecord
  belongs_to :user
  has_many :training, :dependent => :destroy
  has_many :accomplishment, :dependent => :destroy
  mount_uploader :profile_picture, PhotoUploader
  validates_presence_of :date_of_birth, :education, :contact_number, :gender, :civil_status
end
