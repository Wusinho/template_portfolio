class ScrapperJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @about_me = ScrapperServices.call
    p '*'*100
    p @about_me
    p '*'*100
    ActionCable.server.broadcast "about_channel_1", {
      profile: ApplicationController.render(partial: 'homepages/sections/about_me_information', locals: { about_me: @about_me})
    }
  end
end
