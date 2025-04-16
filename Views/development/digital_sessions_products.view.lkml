view: digital_sessions_products {

  sql_table_name: `dbt_aitil.fct_digital_sessions_products` ;;

  dimension: dw_visitor_id {
    type: string
    sql: ${TABLE}.dw_visitor_id ;;
    description: "The unique visitor ID."
  }

  dimension: dw_session_id {
    type: string
    sql: ${TABLE}.dw_session_id ;;
    description: "The unique session and product ID."
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

  dimension: device_mobile_type {
    type: string
    sql: ${TABLE}.device_mobile_type ;;
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

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
    description: "The banner associated with the session or product interaction."
  }

  measure: impression_product_count {
    type: sum
    sql: ${TABLE}.impression_product_count ;;
    description: "The number of product impressions."
  }

  dimension: impression_product_count_discrete {
    type: number
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


  dimension: product_view_count_discrete {
    type: number
    sql: ${TABLE}.product_view_count ;;
    description: "The number of product views."
  }

  dimension: first_impression_product_time {
    type: date_time
    sql: ${TABLE}.first_impression_product_time ;;
    description: "The timestamp of the first product impression."
  }

  dimension: first_view_product_time {
    type: date_time
    sql: ${TABLE}.first_view_product_time ;;
    description: "The timestamp of the first product view."
  }

  dimension: first_add_to_cart_time {
    type: date_time
    sql: ${TABLE}.first_add_to_cart_time ;;
    description: "The timestamp of the first time a product was added to the cart."
  }

  dimension: first_begin_checkout_time {
    type: date_time
    sql: ${TABLE}.first_begin_checkout_time ;;
    description: "The timestamp of the first time the checkout process was started."
  }

  dimension: first_purchase_time {
    type: date_time
    sql: ${TABLE}.first_purchase_time ;;
    description: "The timestamp of the first purchase."
  }

  dimension: session_end_time {
    type: date_time
    sql: ${TABLE}.session_end_time ;;
    description: "The timestamp when the session ended."
  }

  dimension: session_date {
    type: date
    sql: ${TABLE}.session_date ;;
    description: "The date of the session."
  }

  dimension_group: session_start {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.session_start_time ;;
    description: "The start time of the session with various time hierarchies."
  }


  measure: distinct_sessions_with_impressions {
    type: count_distinct
    sql: CASE
      WHEN ${impression_product_count_discrete} > 0 THEN ${dw_session_id}
      ELSE NULL
    END ;;
    description: "Count of distinct session IDs where impression_product_count is greater than 0."
}

  measure: distinct_sessions_with_product_view {
    type: count_distinct
    sql: CASE
      WHEN ${product_view_count_discrete} > 0 THEN ${dw_session_id}
      ELSE NULL
    END ;;
    description: "Count of distinct session IDs where impression_product_count is greater than 0."
  }

}
