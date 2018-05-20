ActiveAdmin.register User do
    permit_params :email, :password,:password_confirmation,:gender,:date_of_birth,:name ,:avatar
    index do
        selectable_column
        id_column
        column :email
        column :name
        column :avatar
        actions
    end

    filter :email


end
