ActiveAdmin.register Candidate do
  permit_params :first_name, :last_name, :aka, :date_of_birth, :gender, :photo_url, :party_profile_url, :website_url, :twitter_url, :facebook_url, :instagram_url, :linkedin_url, :youtube_url, :source_url, :voting_record_url, :claimed_expenses, :constituency_id, :party_id

  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :aka
      f.input :date_of_birth, as: :datetime_picker
      f.input :gender, label: 'Gender', as: :select, collection: ['Male', 'Female', 'Other']
      f.input :photo_url, as: :string
      f.input :party_profile_url, as: :string
      f.input :website_url, as: :string
      f.input :twitter_url, as: :string
      f.input :facebook_url, as: :string
      f.input :instagram_url, as: :string
      f.input :linkedin_url, as: :string
      f.input :youtube_url, as: :string
      f.input :source_url, as: :string
      f.input :voting_record_url, as: :string
      f.input :claimed_expenses, step: 'any'
      f.input :constituency
      f.input :party
    end
    f.actions
  end

  index do
    column "Image" do |c|
      link_to image_tag(c.photo_url, height: 24, width: 24), c.photo_url, target: '_blank'
    end
    
    column :id
    column :first_name
    column :last_name
    column :alias
    column :party
    column :constituency
    column "TD", :current_td
    column "Councillor", :current_councillor
    column "Senator", :current_senator
    actions
  end
end
