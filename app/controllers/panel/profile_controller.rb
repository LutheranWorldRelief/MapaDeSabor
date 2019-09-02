class Panel::ProfileController < Panel::ApplicationController
  include Tabled

  def model
    User
  end

  def edit
    @user = model.find current_user.id
    redirect_to user_root_url if @user != current_user
  end

  def update
    @user = model.find current_user.id
    if @user.update_attributes item_params

      bypass_sign_in @user
      redirect_to edit_panel_profile_url(current_user), notice: t('layouts.admin.notice.updated')

    else
      render template: 'panel/profile/edit'
    end

  end

  def item_params
    params.require(:user).permit(
      :name,
      :password,
    )
  end
end
