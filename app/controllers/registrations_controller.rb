class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource

    if resource.save
      c = Company.find_or_create_by_name(params[:user][:company])
      if c.manager_id.blank?
        c.update_attribute(:manager_id, resource.id)
      end
      resource.update_attribute(:company_id, c.id)

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
    end
  end
end
