ActiveAdmin.register Map do
  permit_params :id, :name, :url, :tier, :created_at, :updated_at
end
