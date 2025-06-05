connection: "gcp-wow-wmp-ai-data-prod"

include: "/Views/development/seller_score.view"

explore: seller_score {
  label: "BI - seller score"
  from: seller_score
}
