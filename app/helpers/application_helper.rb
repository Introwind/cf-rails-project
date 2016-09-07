module ApplicationHelper

def is_active?(link_path)
 current_page?(link_path) ? "active" : ""
end

def admin?
	user_signed_in? && current_user.admin?	
end

end
