connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_bi_orders.view.lkml" # Include the new view

explore: WMP_Orders {
  label: "WMP BI orders"
  from: wmp_bi_orders
}
