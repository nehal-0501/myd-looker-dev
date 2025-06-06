view: digital_session_product_interactions {

  dimension: id {
    primary_key: yes
    sql: CONCAT(${digital_session.session_id AS STRING),'|', CAST(${product_id}) ;;
  }

  dimension: seller_id {}

  dimension: product_id {}

  dimension: banner_product_id {}

  dimension: article_id {}

  dimension: product_impressions {
    label: "Number Of Product Impressions"
    type: number
  }

  dimension: product_views {
    label: "Number Of product_views"
    type: number
  }

  dimension: add_to_carts {
    label: "Number Of add_to_carts"
    type: number
  }

  dimension: begin_checkouts {
    label: "Number Of begin_checkouts"
    type: number
  }

  dimension: purchases {
    label: "Number Of purchases"
    type: number
  }

  measure: total_product_impressions {
    type: sum
    sql: ${product_impressions} ;;
    drill_fields: [digital_session.session_id]
  }

}
