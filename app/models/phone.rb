class Phone < ActiveRecord::Base
  belongs_to :manufacturer

  validates :phone_manufacturer_id, presence: true
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2003 }, length: { is: 4 }
  validates :battery_life, presence: true
end
