class ReposController < ApplicationController
  before_action :set_repo, only: [:repo]
  rescue_from StandardError, with: :handle_error


  def repo
    repo = @repo.repo_info
      render json: {
        repo: repo
      }
  end

  private

  def handle_error(error)
    render json: {
      error: ApplicationController.render(partial: 'shared/error_message', locals: { error: error.message })
    }, status: :unprocessable_entity
  end


  def set_repo
    @repo = Repo.find(params[:id])
  end
end
