class Invoice < ApplicationRecord

  # Model association
  has_many :items, dependent: :destroy

  # Validations

end
