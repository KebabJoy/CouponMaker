# frozen_string_literal: true

class Coupon < ApplicationRecord
  validates_presence_of :expiration_date, :uses_left, :pin
  validates :uses_left, numericality: { greater_than_or_equal_to: 0 }

  def apply
    if Time.zone.now > expiration_date
      errors.add(:expiration_date, 'Срок действия закончился')
      return false
    end

    if uses_left <= 0
      errors.add(:expiration_date, 'Количество использований купона исчерпано')
      return false
    else
      self.uses_left -= 1
    end

    if last_usage && (last_usage - Time.zone.now).abs < 15.minutes
      errors.add(:expiration_date, 'Код введен ранее, попробуйте позже')
      return false
    else
      self.last_usage = Time.zone.now
    end

    save(validate: false)
  end
end
