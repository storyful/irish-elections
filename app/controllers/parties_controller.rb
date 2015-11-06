class PartiesController < ApplicationController
  api :GET, '/parties'
  def index
    respond_to do |format|
      if params[:constituency_id].present?
        @parties = Constituency.friendly.find(params[:constituency_id]).parties
      else
        @parties = Party.all
      end
      format.html
      format.json { render_for_api :default, json: @parties }
      format.xml  { render_for_api :default, xml: @parties }
    end
  end

  def show
    party = Party.friendly.find(params[:id])
    respond_to do |format|
      format.json { render_for_api :default, json: party.candidates, root: :candidates }
      format.xml  { render_for_api :default, xml: party.candidates, root: :candidates }
    end
  end
end
