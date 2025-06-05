connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_refunds.view" # Include the new view

explore: wmp_refunds {
  label: "BI-WMP"
  from: wmp_refunds
}
