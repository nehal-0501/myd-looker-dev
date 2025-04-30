include: "popanalysis.view"
view: fct_transaction_order {
  extends: [popanalysis]
  sql_table_name: `mart_common.fct_transaction_order` ;;

  dimension: order_id {
    type: string
    sql: ${TABLE}.payment_receipt_id ;;
  }

  dimension: accepted_at {
    type: date_time
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: seller_id {
    type: number
    sql: ${TABLE}.seller_id ;;
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

  dimension: line_item_total_incl_gst {
    type: number
    sql: ${TABLE}.line_item_total_incl_gst ;;
  }

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }

  #start dev space

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    # allowed_value: { value: "Fiscal_Week" }
    # allowed_value: { value: "Fiscal_Month" }
    default_value: "Date"
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${accepted_at} AS STRING
    ELSE CAST(${accepted_at} AS STRING)
    END ;;
  }

  dimension_group: accepted_date {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: period {
    hidden: yes
    type: string
    sql: case when ${accepted_at} >= ${filter_start_date_date} AND ${accepted_at} < ${filter_end_date_date} then 'CP'
          when ${accepted_at} >= ${previous_start_date} AND ${accepted_at} < ${filter_start_date_date} then 'PP'
          when ${accepted_at} >= ${previous_year_start_date} AND ${accepted_at} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${accepted_at} >= ${filter_start_date_date} AND ${accepted_at} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${accepted_at} >= ${previous_start_date} AND ${accepted_at} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${accepted_at}) ;;
  }

  measure: order_count {
    type: count_distinct
    sql: case when line_item_total_incl_gst > 0 then ${TABLE}.payment_receipt_id end   ;;
  }

}
