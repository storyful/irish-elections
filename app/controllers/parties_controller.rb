class PartiesController < ApplicationController
  api :GET, '/parties'
  def index
    respond_to do |format|
      @parties = Party.all
      format.html
      format.json { render_for_api :default, xml: @parties }
      format.xml  { render_for_api :default, xml: @parties }
    end
  end
end
