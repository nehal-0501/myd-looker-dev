connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/mart_zendesk_ticket_call_and_cost.view.lkml"
include: "/Views/development/fct_transaction_order.view.lkml" # Include the new view

explore: combined_zendesk_and_refund {
  label: "Zendesk, Refund, and Transaction Data"
  from: mart_zendesk_ticket_call_and_cost

}
