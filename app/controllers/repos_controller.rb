class ReposController < ApplicationController
  before_action :set_repo, only: [:show]
  def show
    p '*'*100
    p @repo
    p '*'*100


  end

  private

  def set_repo
    @repo = Repo.find(params[:id])
  end
end
