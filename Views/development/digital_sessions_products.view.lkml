view: digital_sessions_products {
  sql_table_name: "dbt_aitil.fct_digital_sessions_products" ;;

  dimension: dw_visitor_id {
    type: string
    sql: ${TABLE}.dw_visitor_id ;;
    description: "The unique visitor ID."
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    description: "The unique session ID."
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
    description: "The platform used (e.g., web, mobile)."
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
    description: "The category of the device (e.g., desktop, mobile)."
  }

  dimension: mobile_device_type {
    type: string
    sql: ${TABLE}.mobile_device_type ;;
    description: "The type of mobile device (e.g., iPhone, Android)."
  }

  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
    description: "The city of the user's location."
  }

  dimension: geo_region {
    type: string
    sql: ${TABLE}.geo_region ;;
    description: "The region of the user's location."
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
    description: "The country of the user's location."
  }

  dimension: seller_id {
    type: string
    sql: ${TABLE}.seller_id ;;
    description: "The unique seller ID."
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
    description: "The unique product ID."
  }

  dimension: article_id {
    type: string
    sql: ${TABLE}.article_id ;;
    description: "The unique article ID."
  }

  measure: impression_product_count {
    type: sum
    sql: ${TABLE}.impression_product_count ;;
    description: "The number of product impressions."
  }

  measure: product_view_count {
    type: sum
    sql: ${TABLE}.product_view_count ;;
    description: "The number of product views."
  }

  measure: add_to_cart_count {
    type: sum
    sql: ${TABLE}.add_to_cart_count ;;
    description: "The number of times a product was added to the cart."
  }

  measure: begin_checkout_count {
    type: sum
    sql: ${TABLE}.begin_checkout_count ;;
    description: "The number of times the checkout process was started."
  }

  measure: purchase_count {
    type: sum
    sql: ${TABLE}.purchase_count ;;
    description: "The number of purchases."
  }

  dimension: session_date{
    type: date
    sql: ${TABLE}.session_date;;
    description: "The date of the session"
  }
}
