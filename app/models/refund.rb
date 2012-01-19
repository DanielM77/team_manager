class Refund < ActiveRecord::Base
  belongs_to :team
  REFUND_TYPES = ["Trainingsfahrten", "Auswaertsfahrten"]
  validates :refund_type, :inclusion => REFUND_TYPES
  def is_refundable_distance(distance)
    unless distance.nil?
      self.min_base_value <= distance
    else
      false
    end
  end  
  def share(driver)
    if driver.count > self.max_base_value
      self.value/driver*self.max_base_value
    else
      self.value
    end
  end
end
