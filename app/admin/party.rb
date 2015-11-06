ActiveAdmin.register Party do
  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  permit_params :name
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
