class SiteController < ApplicationController
  def home

  end

  def candidates_csv
    @candidates = Candidate.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"candidates-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end
end
