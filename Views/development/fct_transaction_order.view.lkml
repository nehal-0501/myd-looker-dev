view: fct_transaction_order {
  sql_table_name: `mart_common.fct_transaction_order` ;;

  dimension: dim_seller_sk {
    type: number
    sql: ${TABLE}.dim_seller_sk ;;
  }

  dimension: dw_seller_id {
    type: string
    sql: ${TABLE}.dw_seller_id ;;
  }

  dimension: bid_deal_id {
    type: string
    sql: ${TABLE}.bid_deal_id ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: payment_receipt_id {
    type: string
    sql: ${TABLE}.payment_receipt_id ;;
  }

  dimension: is_payment_approved {
    type: yesno
    sql: ${TABLE}.is_payment_approved ;;
  }

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }

  dimension: accepted_at {
    type: date_time
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: order_type_id {
    type: number
    sql: ${TABLE}.order_type_id ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }

  dimension: order_status_id {
    type: number
    sql: ${TABLE}.order_status_id ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: refund_type_id {
    type: number
    sql: ${TABLE}.refund_type_id ;;
  }

  dimension: refund_type {
    type: string
    sql: ${TABLE}.refund_type ;;
  }

  dimension: refund_reason_id {
    type: number
    sql: ${TABLE}.refund_reason_id ;;
  }

  dimension: refund_reason {
    type: string
    sql: ${TABLE}.refund_reason ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: seller_id {
    type: string
    sql: ${TABLE}.seller_id ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: seller_sku {
    type: string
    sql: ${TABLE}.seller_sku ;;
  }

  dimension: variant_id {
    type: string
    sql: ${TABLE}.variant_id ;;
  }

  dimension: is_freight {
    type: yesno
    sql: ${TABLE}.is_freight ;;
  }

  dimension: is_freight_protection {
    type: yesno
    sql: ${TABLE}.is_freight_protection ;;
  }

  dimension: unit_price_incl_gst {
    type: number
    sql: ${TABLE}.unit_price_incl_gst ;;
  }

  dimension: unit_gst {
    type: number
    sql: ${TABLE}.unit_gst ;;
  }

  dimension: unit_commission_amount {
    type: number
    sql: ${TABLE}.unit_commission_amount ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: line_item_total_excl_gst {
    type: number
    sql: ${TABLE}.line_item_total_excl_gst ;;
  }

  dimension: line_item_total_incl_gst {
    type: number
    sql: ${TABLE}.line_item_total_incl_gst ;;
  }

  dimension: line_item_commission_amount {
    type: number
    sql: ${TABLE}.line_item_commission_amount ;;
  }

  dimension: is_delivery_on_hold {
    type: yesno
    sql: ${TABLE}.is_delivery_on_hold ;;
  }

  dimension: delivery_state {
    type: string
    sql: ${TABLE}.delivery_state ;;
  }

  dimension: delivery_suburb {
    type: string
    sql: ${TABLE}.delivery_suburb ;;
  }

  dimension: delivery_postcode {
    type: string
    sql: ${TABLE}.delivery_postcode ;;
  }

  dimension: is_dispatched {
    type: yesno
    sql: ${TABLE}.is_dispatched ;;
  }

  dimension: dispatched_at {
    type: date_time
    sql: ${TABLE}.dispatched_at ;;
  }

  dimension: days_to_dispatch {
    type: number
    sql: ${TABLE}.days_to_dispatch ;;
  }

  dimension: dispatch_carrier {
    type: string
    sql: ${TABLE}.dispatch_carrier ;;
  }

  dimension: delivery_tracking_number {
    type: string
    sql: ${TABLE}.delivery_tracking_number ;;
  }

  dimension: dss_created_by {
    type: string
    sql: ${TABLE}.dss_created_by ;;
  }

  dimension: dss_updated_by {
    type: string
    sql: ${TABLE}.dss_updated_by ;;
  }

  dimension: dss_invocation_id {
    type: string
    sql: ${TABLE}.dss_invocation_id ;;
  }

  dimension: dss_created_date {
    type: date
    sql: ${TABLE}.dss_created_date ;;
  }

  dimension: dss_updated_date {
    type: date
    sql: ${TABLE}.dss_updated_date ;;
  }
}
