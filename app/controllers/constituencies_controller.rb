class ConstituenciesController < ApplicationController
  api :GET, '/constituencies'
  def index
    respond_to do |format|
      @constituencies = Constituency.all
      format.html
      format.json { render_for_api :default, json: @constituencies }
      format.xml  { render_for_api :default, xml: @constituencies }
    end
  end

  def show
    constituency = Constituency.friendly.find(params[:id])
    respond_to do |format|
      format.json { render_for_api :default, json: constituency.candidates, root: :candidates }
    end
  end
end
