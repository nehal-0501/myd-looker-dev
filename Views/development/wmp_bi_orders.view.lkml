include: "popanalysis.view"
view: wmp_bi_orders {
  extends: [popanalysis]
  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_orders` ;;

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }
  dimension: bid_deal_id {
    type: number
    sql: ${TABLE}.bid_deal_id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
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
  dimension: commission_incl_gst {
    type: number
    sql: ${TABLE}.commission_incl_gst /1.1 ;;
  }
  dimension: courier {
    type: string
    sql: ${TABLE}.courier ;;
  }
  dimension_group: dispatch {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.dispatch_date ;;
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
  dimension: gtin {
    type: string
    sql: ${TABLE}.gtin ;;
  }
  dimension: gtv_incl_gst {
    type: number
    sql: ${TABLE}.gtv_incl_gst /1.1 ;;
  }
  dimension: line_total_incl_gst {
    type: number
    sql: ${TABLE}.line_total_incl_gst /1.1 ;;
  }
  dimension_group: order {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.order_date ;;
  }
  dimension: payment_receipt_id {
    type: number
    sql: ${TABLE}.payment_receipt_id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: refund_reason {
    type: string
    sql: ${TABLE}.refund_reason ;;
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
    sql: ${TABLE}.shipping_fee_incl_gst /1.1 ;;
  }
  dimension: shipping_protection_incl_gst {
    type: number
    sql: ${TABLE}.shipping_protection_incl_gst /1.1 ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: tracking_number {
    type: string
    sql: ${TABLE}.tracking_number ;;
  }
  dimension: unit_price_incl_gst {
    type: number
    sql: ${TABLE}.unit_price_incl_gst /1.1 ;;
  }
  dimension: variant_description {
    type: string
    sql: ${TABLE}.variant_description ;;
  }
  dimension: variant_id {
    type: number
    sql: ${TABLE}.variant_id ;;
  }
  measure: count {
    type: count
    drill_fields: [seller_name, product_name]
  }

  measure: GTV {
    type: sum
    sql: ${gtv_incl_gst}/1.1 ;;
  }
  measure: GMV {
    type: sum
    sql: ${line_total_incl_gst}/1.1;;
  }
  measure: GFV {
    type: sum
    sql: ${shipping_fee_incl_gst}/1.1 ;;
  }
  measure: order_count {
    type: count_distinct
    sql: ${payment_receipt_id} ;;
  }
  measure: total_units {
    type: sum
    sql: ${quantity} ;;
  }

  measure: commission {
    type: sum
    sql: ${commission_incl_gst} ;;
  }

  measure: unique_sku_sold {
    type: count_distinct
    sql: case when ${gtv_incl_gst} > 0 then ${product_id} end ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Fiscal_Week" }
    allowed_value: { value: "Fiscal_Month" }
    default_value: "Date"
  }
  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${order_date} AS STRING)
    WHEN {% parameter timeframe_picker %} = 'Week' THEN ${order_week}
    WHEN {% parameter timeframe_picker %} = 'Month' THEN ${order_month}
    WHEN {% parameter timeframe_picker %} = 'Fiscal_Week' THEN ${fiscal_week}
    WHEN {% parameter timeframe_picker %} = 'Fiscal_Month' THEN ${fiscal_month}
    ELSE CAST(${order_date} AS STRING)
    END ;;
  }


  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${order_date} >= ${filter_start_date_date} AND ${order_date} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${order_date} >= ${previous_start_date} AND ${order_date} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${order_date}) ;;
  }

  dimension: period {
    hidden: yes
    type: string
    sql: case when ${order_date} >= ${filter_start_date_date} AND ${order_date} < ${filter_end_date_date} then 'CP'
          when ${order_date} >= ${previous_start_date} AND ${order_date} < ${filter_start_date_date} then 'PP'
          when ${order_date} >= ${previous_year_start_date} AND ${order_date} < ${previous_year_end_date}  then 'LY' end ;;
  }
}
