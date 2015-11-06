class CandidatesController < ApplicationController
  api :GET, '/candidates'

  def index
    @candidates = Candidate.all
    respond_to do |format|
      format.json { render_for_api :default, json: @candidates }
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"candidates-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end
end
