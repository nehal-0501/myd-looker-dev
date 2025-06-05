connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_bi_orders.view.lkml" # Include the new view

explore: WMP_Orders {
  label: "BI-WMP"
  from: wmp_bi_orders
}
