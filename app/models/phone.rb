class Phone < ApplicationRecord
  validates! :phone_number, uniqueness: true

  PHONE_NUMBER_RANGE = (111_111_1111..999_999_9999)

  def assign_unique_phone_number
    self.phone_number = loop do
      number = rand(PHONE_NUMBER_RANGE)
      break number unless Phone.exists?(phone_number: number)
    end
  end
end
