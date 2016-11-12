class Post < ActiveRecord::Base
  acts_as_votable
  validates :image, presence: true
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :caption, length: {minimum: 3, maximum: 300}
end
