class Listing < ApplicationRecord

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, :description, :price, :image, presence: true
  validates :name, length: { minimum:15 }, uniqueness: true
  validates :description, length: { minimum:350, maximum:3500 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

end
