ActiveAdmin.register Server do
  permit_params :id, :name, :url, :ip, :status, :created_at, :updated_at
end
