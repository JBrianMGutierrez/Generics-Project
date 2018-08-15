class Picture < ApplicationRecord
  belongs_to :accomplishment
  mount_uploader :award_picture, PhotoUploader
end
