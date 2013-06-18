module ApplicationHelper
  def authentication_links
    if user_signed_in?
      content_tag(:li) do
        "#{link_to 'My Shirts', profile_path}".html_safe
      end +
      content_tag(:li) do
        "#{link_to('Logout', destroy_user_session_path, method: :delete)}".html_safe
      end
    else
      content_tag(:li, class: 'pull-right') do
        "#{link_to('Sign Up!', new_user_registration_path)}".html_safe
      end +
      content_tag(:li) do
        "#{link_to('Sign In!', new_user_session_path)} ".html_safe
      end
    end 
  end
end
