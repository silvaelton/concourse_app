class Participation < ActiveRecord::Base

  scope :juridical, -> { where(participation_type: 1).order(:id)}
  scope :normal,    -> { where(participation_type: 0).order(:id)}
end
