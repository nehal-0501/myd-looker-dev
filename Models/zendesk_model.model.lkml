connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/mart_zendesk_ticket_call_and_cost.view.lkml"
include: "/Views/development/wmp_order_refund.view.lkml"

explore: combined_zendesk_and_refund {
  label: "Zendesk and Refund Data"  # Label for the combined Explore
  from: mart_zendesk_ticket_call_and_cost  # Start with one of the views

  }
