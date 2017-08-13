class Facebook < ActiveRecord::Base
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :content_image, ContentImageUploader
end
