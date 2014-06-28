module ApplicationHelper

  def devise_flash_messages
    k, v = {:notice =>:success, :alert => :error}.detect { |k,v| not flash[k].blank? }.to_a
    if k
      content_tag :div, class: "alert alert-#{v}" do
        flash[k].html_safe
      end
    end
  end

  def error_messages_for resource
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
      <div class="alert alert-error" >
        <ul class="unstyled" style="margin-bottom: 0">#{messages}</ul>
      </div>
    HTML
    resource.errors.blank? ? "" : html.html_safe
  end
end
