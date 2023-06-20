class ReposController < ApplicationController
  rescue_from StandardError, with: :handle_error

  def repo
    readme = Repo.repo_info(repo_params[:name])
      render json: {
        readme: readme,
        repo_link: ApplicationController.render(partial: 'shared/repo_link', locals: { repo_link: repo_params[:link] })
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
    params.require(:repo).permit(:name, :link)
  end

end
