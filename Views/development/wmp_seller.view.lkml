include: "popanalysis.view"
view: wmp_seller {
  extends: [popanalysis]
  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_seller` ;;

  dimension: crm_seller_id {
    type: string
    sql: ${TABLE}.crm_seller_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.created_at ;;
  }
  measure: count {
    type: count
  }
  measure: count_sellers {
    type: count_distinct
    sql: ${crm_seller_id} ;;
  }
#start dev space

  dimension: created_at {
    type: string
    sql: cast(${TABLE}.created_at as date) ;;
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
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${created_date} AS STRING
    ELSE CAST(${created_date} AS STRING)
    END ;;
  }

  dimension: period {
    hidden: yes
    type: string
    sql: case when ${created_at} >= ${filter_start_date_date} AND ${created_at} < ${filter_end_date_date} then 'CP'
          when ${created_at} >= ${previous_start_date} AND ${created_at} < ${filter_start_date_date} then 'PP'
          when ${created_at} >= ${previous_year_start_date} AND ${created_at} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${created_at} >= ${filter_start_date_date} AND ${created_at} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${created_at} >= ${previous_start_date} AND ${created_at} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TransactionDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${created_at}) ;;
  }

  dimension: dynamic_timeframe_test {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${created_at} AS STRING END ;;
  }

  dimension: period_test {
    hidden: yes
    type: string
    sql: case when ${created_at} >= ${filter_start_date_date} AND ${created_at} < ${filter_end_date_date} then 'CP'
          when ${created_at} >= ${previous_start_date} AND ${created_at} < ${filter_start_date_date} then 'PP'
          when ${created_at} >= ${previous_year_start_date} AND ${created_at} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period_test {
    hidden: yes
    type: yesno
    sql: ${created_at} >= ${filter_start_date_date} AND ${created_at} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period_test {
    hidden: yes
    type: yesno
    sql: ${created_at} >= ${previous_start_date} AND ${created_at} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week_test {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${created_at}) ;;
  }
}
