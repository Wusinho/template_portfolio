class ReposController < ApplicationController
  before_action :set_repo, only: [:repo]
  def repo
    pic_link = @repo.repo_info
    render json: {
      picture: pic_link
    }
  end

  private

  def set_repo
    @repo = Repo.find(params[:id])
  end
end
