module ApplicationHelper
  
  def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new #@resourceに何も入ってなければUser.newを代入。すでに値が入っていれば左辺の@resourceがtrueになるのでそのまま
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end
