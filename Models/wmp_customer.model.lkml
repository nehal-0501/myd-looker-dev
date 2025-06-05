connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_customer.view.lkml"

explore: WMP_Customer{
  label: "BI-WMP"
  from: wmp_customer
}
