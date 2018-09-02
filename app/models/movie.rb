class Movie < ApplicationRecord
  has_many :reviews
  belongs_to :user
  validates :title, :description, presence: true
  has_attached_file :image, styles: { medium: "400x600#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end