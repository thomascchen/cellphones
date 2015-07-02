class PhoneManufacturer < ActiveRecord::Base
  has_many :phones

  validates :name, presence: true
  validates :country, presence: true
end
