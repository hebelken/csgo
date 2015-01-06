module ApplicationHelper
  def navbar_link(link_text, link_path)
    class_name  = current_page?(link_path)  ? 'active' : nil
    content_tag(:li, "#{class_name}".strip) do
      link_to link_text, link_path
    end
  end
end
