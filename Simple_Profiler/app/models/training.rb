class Training < ApplicationRecord
  belongs_to :profile
  mount_uploader :certificate, PhotoUploader
end
