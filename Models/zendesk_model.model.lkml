connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/mart_zendesk_ticket_call_and_cost.view.lkml"

explore: combined_zendesk_and_refund {
  label: "Customer Service: Zendesk ticket + Orders"
  from: mart_zendesk_ticket_call_and_cost

}
