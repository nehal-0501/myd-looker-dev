connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_bi_orders.view.lkml" # Include the new view

explore: wmp_bi_orders {
  label: "BI - WMP Orders"
  from: wmp_bi_orders
}
