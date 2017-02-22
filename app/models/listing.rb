class Listing < ApplicationRecord

  #if Rails.env.development?
    #has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  #else
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  #end

  validates :name, :description, :price, :image, presence: true
  validates :name, length: { minimum:15 }
  validates :description, length: { minimum:350, maximum:3500 }
  validates :price, numericality: { greater_than: 0 }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

end
