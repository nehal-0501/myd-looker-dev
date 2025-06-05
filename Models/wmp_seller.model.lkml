connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_seller.view.lkml"

explore: WMP_Seller{
  label: "BI-WMP"
  from: wmp_seller
}
