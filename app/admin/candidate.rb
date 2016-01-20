ActiveAdmin.register Candidate do
  permit_params :first_name, :last_name, :aka, :date_of_birth, :gender, :photo_url, :party_profile_url, :website_url, :twitter_handle, :facebook_url, :instagram_url, :linkedin_url, :youtube_url, :source_url, :voting_record_url, :claimed_expenses, :constituency_id, :party_id, :snapchat_url, :phone_1, :phone_2, :current_td, :current_councillor, :current_senator, :email

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
      f.input :email, as: :string
      f.input :website_url, as: :string
      f.input :twitter_handle, as: :string
      f.input :facebook_url, as: :string
      f.input :instagram_url, as: :string
      f.input :linkedin_url, as: :string
      f.input :youtube_url, as: :string
      f.input :snapchat_url, as: :string
      f.input :phone_1, as: :string
      f.input :phone_2, as: :string
      f.input :source_url, as: :string
      f.input :voting_record_url, as: :string
      f.input :claimed_expenses, step: 'any'
      f.input :constituency
      f.input :party
      f.input :current_td
      f.input :current_councillor
      f.input :current_senator
    end
    f.actions
  end

  show as: :grid do |c|
    attributes_table do
      row :image do
        link_to image_tag(profile_pic(c), height: 128, width: 128), profile_pic(c), target: '_blank'
      end

      row :first_name
      row :last_name
      row :aka
      row :date_of_birth
      row :gender
      row :photo_url
      row :party_profile_url
      row :email
      row :website_url
      row :twitter_handle
      row :facebook_url
      row :instagram_url
      row :linkedin_url
      row :youtube_url
      row :snapchat_url
      row :phone_1
      row :phone_2
      row :source_url
      row :voting_record_url
      row :claimed_expenses
      row :constituency
      row :party
      row :current_td
      row :current_councillor
      row :current_senator
    end
  end

  index do
    column "Image" do |c|
      link_to image_tag(profile_pic(c), height: 24, width: 24), profile_pic(c), target: '_blank'
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
