view: seller_score {
  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.seller_score` ;;

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }
  dimension: crm_seller_id {
    type: number
    sql: ${TABLE}.crm_seller_id ;;
  }
  dimension: product_rating {
    type: number
    sql: ${TABLE}.product_rating ;;
  }
  dimension_group: reporting_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.reporting_month ;;
  }
  dimension: seller_score {
    type: number
    sql: ${TABLE}.seller_score ;;
  }
  measure: count {
    type: count
  }
}
