class CandidatesController < ApplicationController
  api :GET, '/candidates'

  caches_action :index, cache_path: Proc.new {|c| c.request.url }, expires_in: 5.minutes

  def index
    @candidates = candidates
    @pagetitle = 'Candidates'
    respond_to do |format|
      format.html
      format.json { render_for_api :default, json: @candidates }
      format.xml { render_for_api :default, xml: @candidates }
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"candidates-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def show
    @candidate = Candidate.friendly.find(params[:id])
    @pagetitle = @candidate.full_name
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
    elsif params[:party_id].present?
      Party.friendly.find(params[:party_id]).candidates
    else
      Candidate.list.order(last_name: :asc)
    end
  end

end
