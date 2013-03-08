class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    new_encoding_job_path
  end
end
