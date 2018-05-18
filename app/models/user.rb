class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  acts_as_commontator
  mount_uploader :avatar, AvatarUploader
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  enum gender: [:female, :male]
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
  has_many :courses
end
