class SurfServer < ActiveRecord::Base
  validates :ip, uniqueness: true
  validates :name, :ip, presence: true

  belongs_to :user
  belongs_to :server_group
end
