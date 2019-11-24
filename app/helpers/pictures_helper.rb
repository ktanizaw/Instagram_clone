module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_pictures_path
    elsif action_name == 'edit'
      picture_path
    end
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
