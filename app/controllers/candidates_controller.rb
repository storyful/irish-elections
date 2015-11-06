class CandidatesController < ApplicationController
  api :GET, '/candidates'

  caches_action :index, cache_path: Proc.new {|c| c.request.url }, expires_in: 1.hour

  def index
    @candidates = candidates
    respond_to do |format|
      format.html
      format.json { render_for_api :default, json: @candidates }
      format.xml { render_for_api :default, xml: @candidates }
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"candidates-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def show
    @candidate = Candidate.friendly.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render_for_api :default, json: @candidate }
      format.xml { render_for_api :default, xml: @candidate }
    end
  end

  protected

  def candidates
    if params[:q].present?
      Candidate.search(params[:q])
    elsif params[:constituency_id].present?
      Constituency.friendly.find(params[:constituency_id]).candidates
    else
      Candidate.list
    end
  end

end
