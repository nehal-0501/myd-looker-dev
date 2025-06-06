include: "popanalysis.view"
view: wmp_customer {
  extends: [popanalysis]
  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_customer` ;;

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
  }
  dimension: customerregistrationnumber {
    type: string
    sql: ${TABLE}.customerregistrationnumber ;;
  }
  dimension: platformcustomerid {
    type: string
    sql: ${TABLE}.platformcustomerid ;;
  }

  dimension_group: transactiondate {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.transactiondate ;;
  }

  dimension: transaction_date {
    type: string
    sql: cast(${TABLE}.transactiondate as date) ;;
  }

  measure: count_shoppers {
    type: count_distinct
    sql: ${platformcustomerid} ;;
  }

  measure: count_members {
    type: count_distinct
    sql: ${customerregistrationnumber} ;;
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
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${transaction_date} AS STRING
    ELSE CAST(${transaction_date} AS STRING)
    END ;;
  }


  dimension: period {
    hidden: yes
    type: string
    sql: case when ${transaction_date} >= ${filter_start_date_date} AND ${transaction_date} < ${filter_end_date_date} then 'CP'
          when ${transaction_date} >= ${previous_start_date} AND ${transaction_date} < ${filter_start_date_date} then 'PP'
          when ${transaction_date} >= ${previous_year_start_date} AND ${transaction_date} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${transaction_date} >= ${filter_start_date_date} AND ${transaction_date} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${transaction_date} >= ${previous_start_date} AND ${transaction_date} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TransactionDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${transaction_date}) ;;
  }

  dimension: dynamic_timeframe_test {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${transaction_date} AS STRING END ;;
  }

  dimension: period_test {
    hidden: yes
    type: string
    sql: case when ${transaction_date} >= ${filter_start_date_date} AND ${transaction_date} < ${filter_end_date_date} then 'CP'
          when ${transaction_date} >= ${previous_start_date} AND ${transaction_date} < ${filter_start_date_date} then 'PP'
          when ${transaction_date} >= ${previous_year_start_date} AND ${transaction_date} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period_test {
    hidden: yes
    type: yesno
    sql: ${transaction_date} >= ${filter_start_date_date} AND ${transaction_date} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period_test {
    hidden: yes
    type: yesno
    sql: ${transaction_date} >= ${previous_start_date} AND ${transaction_date} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week_test {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${transaction_date}) ;;
  }

}
