ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :name, :phone_no, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  show do
    attributes_table do
      row :name
      row :email
      row :phone_no
      row :created_at
      row :updated_at 
    end 

    table_for(user.events) do |event|
      column 'Request For' do |event|
        event&.name 
      end
      column 'Start From' do |event|
        event&.start_date
      end
      column 'End To' do |event|
        event&.end_date
      end
      column 'Reason/Description' do |event|
        event&.reason
      end
      column 'Approved' do |event|
        event&.approved
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name 
    column :email
    column :phone_no
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs do
      f.input :name 
      f.input :email 
      f.input :phone_no 
    end
    f.actions
  end
end
