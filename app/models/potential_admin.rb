class PotentialAdmin < ActiveRecord::Base
  attr_accessible :email, :generated_number

  validates :email, :uniqueness => true

  before_create :generate_unique_number

  def generate_unique_number
    number = SecureRandom.hex(3)
    while PotentialAdmin.find_by_generated_number(number)
      number = SecureRandom.hex(3)
    end
    self.generated_number = number
  end
end
