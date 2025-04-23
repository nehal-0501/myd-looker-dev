view: fct_transaction_order {
  sql_table_name: `ssong_sandbox.fct_transaction_order` ;;

  dimension: bid_deal_id {
    type: string
    sql: ${TABLE}.bid_deal_id ;;
  }

  dimension: accepted_at {
    type: date_time
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: seller_id {
    type: number
    sql: ${TABLE}.dss_updated_date ;;
  }

  measure: order_count {
    type: count_distinct
    sql: ${TABLE}.dw_bid_deal_id ;;
  }


}
