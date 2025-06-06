connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/digital_sessions.view.lkml"
include: "/Views/development/digital_session_product_interactions.view.lkml"
include: "/Views/development/fct_digital_search_product_summary.view.lkml"


explore: digital_sessions {
  join: digital_session_product_interactions {
    view_label: "Sessions: Product Interactions:"
    sql: LEFT JOIN UNNEST(digital_sessions.product_interactions) as digital_session_product_interactions ;;
    relationship: one_to_many
  }

}

explore: fct_digital_search_product_summary {
  label: "Digital Search Product Summary"
  from: fct_digital_search_product_summary
}
