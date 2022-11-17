ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :duration, :mulitmedia_type, :image, :mulitmedia
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :duration, :type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do 
      f.input :name 
      f.input :duration, :as => :time_picker, :input_html => { :value => "00:00:00", :maxlength => 20 , :step => :second }
      f.input :mulitmedia_type
      f.input :image, as: :file, :hint => f.object.image.present? ? image_tag(f.object.image, :size => "260x180") : "Upload Thumbnail"
      f.input :mulitmedia, as: :file
    end 
    actions
  end

  show do
    attributes_table do
      row :name 
      row :duration
      row :mulitmedia_type
      row "Thumbnail" do |resource|
        image_tag(url_for(resource.image), style: "width:300px;height:200px") if resource.image.present?
      end
      row "Audo" do |resource|
        if resource.mulitmedia.present? && resource.mulitmedia_type == 'audio'
          audio_tag(url_for(resource.mulitmedia), controls: true)
        end
      end
      row "Video" do |resource|
        if resource.mulitmedia.present? && resource.mulitmedia_type == 'video'
          video_tag(url_for(resource.mulitmedia), size: "300x200", autoplay: true, controls: true) 
        end                
      end 
    end
  end
  
end
