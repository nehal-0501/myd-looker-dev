connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/fct_transaction_order.view.lkml" # Include the new view

explore: wmp_fct_transaction_orders {
  label: "Customer Service: Zendesk ticket + Orders"
  from: fct_transaction_order

}
