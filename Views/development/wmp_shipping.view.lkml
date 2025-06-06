include: "popanalysis.view"
view: wmp_shipping {
  extends: [popanalysis]
  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_shipping` ;;

  dimension_group: carrier1stscan {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.carrier1stscan ;;
  }
  dimension: customermarketplace {
    type: string
    sql: ${TABLE}.customermarketplace ;;
  }

  dimension_group: orderdispatchdate {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.orderdispatchdate ;;
  }


  dimension_group: orderplaceddate {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.orderplaceddate ;;
  }


  dimension: pre_disp_early_late {
    type: string
    sql: ${TABLE}.PreDispEarlyLate ;;
  }
  dimension_group: shipment_delivery_first_attempted {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.shipmentDeliveryFirstAttemptedAt ;;
  }
  dimension: trackingnumber {
    type: string
    sql: ${TABLE}.trackingnumber ;;
  }
  dimension: traderorderid {
    type: string
    sql: ${TABLE}.traderorderid ;;
  }
  measure: count {
    type: count
  }

  measure: count_tracking_number {
    type: count_distinct
    sql:  ${trackingnumber} ;;
  }

  measure: total_delivery_time {
    type: sum
    sql:  CASE
      WHEN ${TABLE}.orderplaceddate IS NOT NULL THEN DATETIME_DIFF(${TABLE}.shipmentDeliveryFirstAttemptedAt, ${TABLE}.orderplaceddate, MINUTE) / 1440
  END ;;
  }

  measure: count_edd_accurate_tracking_number {
    type: count_distinct
    sql: CASE
      WHEN ${customermarketplace} = 'EDM' AND ${pre_disp_early_late} = 'Early' OR ${pre_disp_early_late} = 'On Time' THEN ${trackingnumber} END ;;
  }

  measure: count_delivered_7days_tracking_number {
    type: count_distinct
    sql: CASE
      WHEN ${TABLE}.orderplaceddate IS NOT NULL AND DATE_DIFF(${TABLE}.shipmentDeliveryFirstAttemptedAt, ${TABLE}.orderplaceddate, DAY) <= 7 THEN ${trackingnumber} END ;;
  }

  measure: count_ontime_dispatch_tracking_number {
    type: count_distinct
    sql: CASE
      WHEN ${TABLE}.orderplaceddate IS NOT NULL AND  ${TABLE}.orderDispatchDate IS NOT NULL AND DATETIME_DIFF(${TABLE}.orderDispatchDate, ${TABLE}.orderplaceddate, minute)/1440 > 3 THEN ${trackingnumber} END ;;
  }

  measure: count_total_dispatch_tracking_number {
    type: count_distinct
    sql: CASE
      WHEN ${TABLE}.orderDispatchDate IS NOT NULL AND  ${TABLE}.orderDispatchDate > ${TABLE}.orderplaceddate THEN ${trackingnumber} END ;;
  }

  measure: count_scan_rate_tracking_number {
    type: count_distinct
    sql: CASE
      WHEN ${TABLE}.Carrier1stScan IS NOT NULL THEN ${trackingnumber} END ;;
  }

  measure: count_edm_tracking_number {
    type: count_distinct
    sql: CASE
      WHEN ${customermarketplace} = 'EDM' THEN ${trackingnumber} END ;;
  }

#start dev space

  dimension: shipment_first_attempted_at {
    type: string
    sql: cast(${TABLE}.shipmentDeliveryFirstAttemptedAt as date) ;;
  }

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
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${shipment_first_attempted_at} AS STRING
    ELSE CAST(${shipment_first_attempted_at} AS STRING)
    END ;;
  }

  dimension: period {
    hidden: yes
    type: string
    sql: case when ${shipment_first_attempted_at} >= ${filter_start_date_date} AND ${shipment_first_attempted_at} < ${filter_end_date_date} then 'CP'
          when ${shipment_first_attempted_at} >= ${previous_start_date} AND ${shipment_first_attempted_at} < ${filter_start_date_date} then 'PP'
          when ${shipment_first_attempted_at} >= ${previous_year_start_date} AND ${shipment_first_attempted_at} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${shipment_first_attempted_at} >= ${filter_start_date_date} AND ${shipment_first_attempted_at} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${shipment_first_attempted_at} >= ${previous_start_date} AND ${shipment_first_attempted_at} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TransactionDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${shipment_first_attempted_at}) ;;
  }

  dimension: dynamic_timeframe_test {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${shipment_first_attempted_at} AS STRING END ;;
  }

  dimension: period_test {
    hidden: yes
    type: string
    sql: case when ${shipment_first_attempted_at} >= ${filter_start_date_date} AND ${shipment_first_attempted_at} < ${filter_end_date_date} then 'CP'
          when ${shipment_first_attempted_at} >= ${previous_start_date} AND ${shipment_first_attempted_at} < ${filter_start_date_date} then 'PP'
          when ${shipment_first_attempted_at} >= ${previous_year_start_date} AND ${shipment_first_attempted_at} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period_test {
    hidden: yes
    type: yesno
    sql: ${shipment_first_attempted_at} >= ${filter_start_date_date} AND ${shipment_first_attempted_at} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period_test {
    hidden: yes
    type: yesno
    sql: ${shipment_first_attempted_at} >= ${previous_start_date} AND ${shipment_first_attempted_at} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week_test {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${shipment_first_attempted_at}) ;;
  }
}
