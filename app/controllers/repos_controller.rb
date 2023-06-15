class ReposController < ApplicationController
  before_action :set_repo, only: [:repo]

  def repo
    repo = @repo.repo_info
    render json: {
      repo: repo
    }
  end

  private

  def set_repo
    @repo = Repo.find(params[:id])
  end
end
