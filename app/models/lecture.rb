class Lecture < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
    belongs_to :course
    acts_as_commontable
    acts_as_votable
end
