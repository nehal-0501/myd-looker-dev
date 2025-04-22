connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/mart_zendesk_ticket_call_and_cost.view.lkml"
include: "/Views/development/fct_transaction_order.view.lkml" # Include the new view

explore: combined_zendesk_and_refund {
  label: "Zendesk, Refund, and Transaction Data"
  from: mart_zendesk_ticket_call_and_cost

  join: fct_transaction_order { # Join fct_transaction_order
    type: left_outer
    sql_on: ${combined_zendesk_and_refund.mp_seller_id} = ${fct_transaction_order.seller_id} ;;
    relationship: many_to_one #  You might need to adjust this relationship
  }
}
