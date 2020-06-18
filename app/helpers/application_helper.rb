module ApplicationHelper
    def user_actions(current_user)
        html = ''
    
        if current_user
          html += link_to("Profile (#{current_user.username})", current_user)
          html += ' - '
          html += link_to('Log Out', logout_path)
          html += ' - '
          html += link_to("Create Event", new_event_path)
        else
          html += link_to('Sign Up', signup_path)
          html += ' or '
          html += link_to('Log In', login_path)
        end
        html.html_safe
      end
end
