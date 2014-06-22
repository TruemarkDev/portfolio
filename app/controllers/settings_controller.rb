class SettingsController < ApplicationController
  load_and_authorize_resource :setting

  def index
  end

  def show
  end

  def new
  end

  def create
    if @setting.save
      redirect_to settings_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @setting.update_attributes(setting_params)
      redirect_to setting_path(@setting)
    else
      render :edit
    end
  end

  def destroy
    @setting.destroy
    redirect_to settings_path
  end

private

  def setting_params
    params.require(:setting).permit(
      :env, :host, :title, :copyright_holder, :contact_text,
      :contact_text_ua, :facebook_account, :flickr_user_id, :linkedin_account,
      :description, :flickr_api_key, :flickr_shared_secret, :flickr_access_token,
      :flickr_access_secret, :google_analytics_account, :disqus_shortname, :disqus_developer,
      :disqus_api_secret, :disqus_api_key, :disqus_access_token
    )
  end
end
