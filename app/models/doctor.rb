class Doctor < ApplicationRecord
  has_many :reservations

  before_validation :set_default_image_url

  validates :image, format: { with: /\.(png|jpg)\z/,
                              message: 'must be a valid PNG or JPG image file or a URL' }, allow_blank: true

  validates :image_url, format: { with: %r{\Ahttps?://.*\.(png|jpg|webp)\z},
                                  message: 'must be a valid URL ending in PNG or JPG' }, allow_blank: true

  private

  def set_default_image_url
    self.image_url ||= 'https://cdn.vectorstock.com/i/preview-2x/12/29/icon-of-medical-doctor-with-shadow-in-modern-flat-vector-3351229.webp'
  end
end
