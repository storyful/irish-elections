class ConstituenciesController < ApplicationController
  api :GET, '/constituencies'
  def index
    respond_to do |format|
      if params[:party_id].present?
        @constituencies = Party.friendly.find(params[:party_id]).constituencies
      else
        @constituencies = Constituency.all
      end
      format.html
      format.json { render_for_api :default, json: @constituencies }
      format.xml  { render_for_api :default, xml: @constituencies }
    end
  end

  def show
    constituency = Constituency.friendly.find(params[:id])
    respond_to do |format|
      format.json { render_for_api :default, json: constituency.candidates, root: :candidates }
      format.xml  { render_for_api :default, xml: constituency.candidates, root: :candidates }
    end
  end
end
