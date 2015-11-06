ActiveAdmin.register Constituency do
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
