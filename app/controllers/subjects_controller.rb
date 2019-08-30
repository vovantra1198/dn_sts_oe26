class SubjectsController < ApplicationController
  before_action :load_subject, only: :show

  def show; end

  private

  def load_subject
    @subject = Subject.find_by(id: params[:id])
    return if @subject
    flash["danger"] = t ".courses.notfound.notfound"
    redirect_to notfound_path
  end
end
