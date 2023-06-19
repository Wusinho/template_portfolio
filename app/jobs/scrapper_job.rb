class ScrapperJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ScrapperServices.call
  end
end
