view: fct_transaction_order {
  sql_table_name: `mart_common.fct_transaction_order` ;;

  dimension: payment_receipt_id {
    type: string
    sql: ${TABLE}.payment_receipt_id ;;
  }

  dimension: order_date {
    type: date_time
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: seller_id {
    type: number
    sql: ${TABLE}.seller_id ;;
  }

  measure: order_count {
    type: count_distinct
    sql: ${TABLE}.order_id ;;
  }

  dimension: bid_deal_id {
    type: string
    sql: ${TABLE}.bid_deal_id ;;
  }


  dimension: sellerid {
    type: string
    sql: ${TABLE}.sellerid ;;
  }

  dimension: sellername {
    type: string
    sql: ${TABLE}.sellername ;;
  }

  dimension: total_line_item_incl_gst {
    type: number
    sql: ${TABLE}.total_line_item_incl_gst ;;
  }

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }
}
