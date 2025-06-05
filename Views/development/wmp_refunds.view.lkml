view: wmp_refunds {
  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_refunds` ;;

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }
  dimension: banner_refund_bid_deal_id {
    type: string
    sql: ${TABLE}.banner_refund_bid_deal_id ;;
  }
  dimension: banner_refund_payment_receipt_id {
    type: string
    sql: ${TABLE}.banner_refund_payment_receipt_id ;;
  }
  dimension: bid_deal_id {
    type: number
    sql: ${TABLE}.bid_deal_id ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  dimension_group: dispatch {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dispatch_date ;;
  }
  dimension: expected_commission_incl_gst {
    type: number
    sql: ${TABLE}.expected_commission_incl_gst ;;
  }
  dimension: fiscal_month {
    type: number
    sql: ${TABLE}.fiscal_month ;;
  }
  dimension: fiscal_week {
    type: number
    sql: ${TABLE}.fiscal_week ;;
  }
  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }
  dimension: line_total_incl_gst {
    type: number
    sql: ${TABLE}.line_total_incl_gst ;;
  }
  dimension: parent_bid_deal_id {
    type: number
    sql: ${TABLE}.parent_bid_deal_id ;;
  }
  dimension_group: parent_order {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.parent_order_date ;;
  }
  dimension: parent_payment_receipt_id {
    type: number
    sql: ${TABLE}.parent_payment_receipt_id ;;
  }
  dimension: payment_receipt_id {
    type: number
    sql: ${TABLE}.payment_receipt_id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension_group: refund_approved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.refund_approved_date ;;
  }
  dimension: refund_cycle {
    type: number
    sql: ${TABLE}.refund_cycle ;;
  }
  dimension: refund_detail {
    type: string
    sql: ${TABLE}.refund_detail ;;
  }
  dimension: refund_reason {
    type: string
    sql: ${TABLE}.refund_reason ;;
  }
  dimension: refund_reason_id {
    type: number
    sql: ${TABLE}.refund_reason_id ;;
  }
  dimension: refund_type {
    type: string
    sql: ${TABLE}.refund_type ;;
  }
  dimension: refund_type_id {
    type: number
    sql: ${TABLE}.refund_type_id ;;
  }
  dimension: seller_id {
    type: string
    sql: ${TABLE}.seller_id ;;
  }
  dimension: seller_name {
    type: string
    sql: ${TABLE}.seller_name ;;
  }
  dimension: shipping_fee_incl_gst {
    type: number
    sql: ${TABLE}.shipping_fee_incl_gst ;;
  }
  dimension: shipping_protection_incl_gst {
    type: number
    sql: ${TABLE}.shipping_protection_incl_gst ;;
  }
  dimension: shipping_protection_quantity {
    type: number
    sql: ${TABLE}.shipping_protection_quantity ;;
  }
  dimension: shipping_quantity {
    type: number
    sql: ${TABLE}.shipping_quantity ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: variant_id {
    type: number
    sql: ${TABLE}.variant_id ;;
  }
  measure: count {
    type: count
    drill_fields: [seller_name]
  }
}
