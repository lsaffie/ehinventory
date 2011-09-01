module ApplicationHelper
  def print_ticket_title(ticket)
    if @controller.class == SoftwaresController
      path = software_ticket_path(@software, ticket)
    elsif @controller.class == HardwaresController
      path = hardware_ticket_path(@hardware, ticket)
    else
      path = document_ticket_path(@document, ticket)
    end
    path
  end

  def print_destroy_ticket_link(ticket)
    haml_concat(link_to 'Destroy', ticket_path(ticket))
  end

  def search_form(resource)
    render 'shared/search', :path => '/'+resource
  end

  def current_link?(controller)
    request.url.match(controller) ? {:class => 'current'} : nil
  end

end
