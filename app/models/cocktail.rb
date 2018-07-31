class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
  has_many :doses, :dependent => :destroy
  has_many :ingredients, :through => :doses

  include PgSearch
  pg_search_scope :search, against: [:name]
  mount_uploader :image, ImageUploader

end
