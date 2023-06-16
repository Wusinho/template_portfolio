class ReposController < ApplicationController
  before_action :set_repo, only: [:repo]
  rescue_from StandardError, with: :handle_error


  def repo
    readme = @repo.repo_info
      render json: {
        readme: readme,
        repo_link: ApplicationController.render(partial: 'shared/repo_link', locals: { repo_link: @repo.repo_link })
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
