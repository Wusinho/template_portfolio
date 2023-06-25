class ReposController < ApplicationController
  rescue_from StandardError, with: :handle_error

  def create
    readme = Repo.repo_info(repo_params[:name])
    render json: {
      repo_link: ApplicationController.render(partial: 'shared/selected_readme', locals: { link: repo_params[:link], readme: readme })
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

  private

  def repo_params
    params.permit(:name, :link)
  end

end
