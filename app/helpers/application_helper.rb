# Methods added to this helper will be available to all templates in the application.
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
    haml_concat(link_to_remote 'Destroy', :url => ticket_path(ticket), :confirm => 'Are you sure?', :method => :delete)
  end
end
