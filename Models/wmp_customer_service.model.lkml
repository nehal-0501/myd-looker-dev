connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_customer_service.view.lkml"

explore: WMP_Customer_Service{
  label: "BI - Customer Service"
  from: wmp_customer_service
}
