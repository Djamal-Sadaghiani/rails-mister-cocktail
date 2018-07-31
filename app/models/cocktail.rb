class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true, uniqueness: true
  has_many :doses, :dependent => :destroy
  has_many :ingredients, :through => :doses

  include PgSearch
  pg_search_scope :search, against: [:name]
end
