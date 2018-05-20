class Lecture < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
    belongs_to :course
    has_and_belongs_to_many :users
    acts_as_votable
    acts_as_commontable
end
