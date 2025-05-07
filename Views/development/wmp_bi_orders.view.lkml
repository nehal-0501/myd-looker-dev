view: wmp_bi_orders {

  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_orders` ;;

  dimension: fiscal_month {
    type: string
    sql: ${TABLE}.Fiscal_Month ;;
  }

  dimension: fiscal_week {
    type: string
    sql: ${TABLE}.Fiscal_Week ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.Fiscal_Year ;;
  }

  dimension: payment_receipt_id {
    type: string
    sql: ${TABLE}.payment_receipt_id ;;
  }

  dimension: bid_deal_id {
    type: string
    sql: ${TABLE}.bid_deal_id ;;
  }

  dimension_group: order_date {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.order_date ;;
  }

  dimension_group: dispatch_date {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dispatch_date ;;
  }

  dimension: seller_id {
    type: number
    sql: ${TABLE}.seller_id ;;
  }

  dimension: seller_name {
    type: number
    sql: ${TABLE}.seller_name ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }

  dimension: variant_id {
    type: string
    sql: ${TABLE}.variant_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: unit_price_incl_gst {
    type: string
    sql: ${TABLE}.unit_price_incl_gst ;;
  }

  dimension: commission_incl_gst {
    type: number
    sql: ${TABLE}.commission_incl_gst ;;
  }

  dimension: courier {
    type: string
    sql: ${TABLE}.courier ;;
  }

  dimension: tracking_number {
    type: string
    sql: ${TABLE}.tracking_number ;;
  }

  dimension: refund_reason {
    type: string
    sql: ${TABLE}.refund_reason ;;
  }

  dimension: refund_type_id {
    type: number
    sql: ${TABLE}.refund_type_id ;;
  }

  dimension: reason_type {
    type: string
    sql: ${TABLE}.reason_type ;;
  }

  dimension: variant_description {
    type: string
    sql: ${TABLE}.variant_description ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: gtin {
    type: string
    sql: ${TABLE}.gtin ;;
  }
  dimension: category_level_1 {
    type: string
    sql: ${TABLE}.category_level_1 ;;
  }

  dimension: category_level_2 {
    type: string
    sql: ${TABLE}.category_level_2 ;;
  }

  dimension: category_level_3 {
    type: string
    sql: ${TABLE}.category_level_3 ;;
  }

  dimension: category_level_4 {
    type: string
    sql: ${TABLE}.category_level_4 ;;
  }

  dimension: shipping_protection_incl_gst {
    type: number
    sql: ${TABLE}.shipping_protection_incl_gst ;;
  }

  dimension: line_total_incl_gst {
    type: number
    sql: ${TABLE}.line_total_incl_gst ;;
  }

  dimension: shipping_fee_incl_gst {
    type: number
    sql: ${TABLE}.shipping_fee_incl_gst ;;
  }

  dimension: gtv_incl_gst {
    type: number
    sql: ${TABLE}.gtv_incl_gst ;;
  }


}
