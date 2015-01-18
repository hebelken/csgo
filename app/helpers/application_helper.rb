module ApplicationHelper
  def navbar_link(link_text, link_path, i = nil)
    class_name  = current_page?(link_path)  ? 'active' : nil
    content_tag(:li, "#{class_name}".strip) do
      if i
        link_to %{<i class="fa fa-#{i}"></i> #{link_text}}.html_safe, link_path
      else
        link_to link_text, link_path
      end
    end
  end
end
