connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/mart_zendesk_ticket_call_and_cost.view.lkml"
include: "/Views/development/wmp_order_refund.view.lkml"

explore: mart_zendesk_ticket_call_and_cost {
  label: "Zendesk Ticket Call and Cost"
}

explore: wmp_order_refund {
  label: "WMP Order Refund"
}
