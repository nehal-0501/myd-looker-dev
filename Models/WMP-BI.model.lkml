connection: "gcp-wow-wmp-ai-data-prod"

include: "/Views/development/*.view"                # include all views in the views/ folder in this project


explore: digital_sessions {
  join: digital_session_product_interactions {
    view_label: "Sessions: Product Interactions:"
    sql: LEFT JOIN UNNEST(digital_sessions.product_interactions) as digital_session_product_interactions ;;
    relationship: one_to_many
  }
}

explore: seller_score {
  label: "wmp seller score"
  from: seller_score
}


explore: WMP_Orders {
  label: "wmp orders"
  from: wmp_bi_orders
}


explore: WMP_Customer{
  label: "wmp customer"
  from: wmp_customer
}


explore: WMP_Customer_Service{
  label:  "wmp customer service"
  from: wmp_customer_service
}

explore: wmp_refunds {
  label: "wmp refunds"
  from: wmp_refunds
}

explore: WMP_Seller{
  label: "wmp seller"
  from: wmp_seller
}

explore: WMP_Shipping{
  label: "wmp shipping"
  from: wmp_shipping
}

explore: digital_search_product_summary {
  label: "Digital - Search Product Summary"
  from: fct_digital_search_product_summary
}

explore: WMP_Design{
  label: "wmp design"
  from: wmp_design
}

explore: wmp_product_daily{
  label: "wmp product daily"
  from: wmp_product_daily
}
