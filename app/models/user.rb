class User < ApplicationRecord

  def back_up_save(information)
    return if time_to_update?

    self.update(information: information)
  end

  def time_to_update?
    Time.now - self.updated_at >= 23.hours
  end
end
