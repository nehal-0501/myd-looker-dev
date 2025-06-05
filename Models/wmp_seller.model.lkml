connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/wmp_seller.view.lkml"

explore: WMP_Seller{
  label: "WMP BI seller"
  from: wmp_seller
}
