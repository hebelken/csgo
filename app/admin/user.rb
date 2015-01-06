ActiveAdmin.register User do
  permit_params :id, :email, :created_at, :updated_at
end
