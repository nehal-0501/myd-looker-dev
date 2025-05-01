view: digital_session_product_interactions {

  dimension: id {
    primary_key: yes
    sql: CONCAT(${digital_session.session_key AS STRING),'|', CAST(${product_id}) ;;
  }

  dimension: seller_id {}

  dimension: product_id {}

  dimension: article_id {}

  dimension: product_impressions {
    label: "Number Of Product Impressions"
    type: number
  }

  measure: total_product_impressions {
    type: sum
    sql: ${product_impressions} ;;
    drill_fields: [digital_session.session_key]
  }

}
