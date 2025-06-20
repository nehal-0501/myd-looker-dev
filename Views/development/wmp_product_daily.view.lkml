include: "popanalysis.view"

view: wmp_product_daily {

  extends: [popanalysis]

  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_product_daily` ;;



  dimension: count_active_skus {

    type: number

    sql: ${TABLE}.count_active_skus ;;

  }

  dimension: count_buyable_skus {

    type: number

    sql: ${TABLE}.count_buyable_skus ;;

  }

  dimension: count_no_stock_skus {

    type: number

    sql: ${TABLE}.count_no_stock_skus ;;

  }



  dimension: calculated_date {

    type: string

    sql: cast(${TABLE}.dss_snapshot_date as date) ;;

  }



  dimension_group: dss_snapshot {

    type: time

    timeframes: [raw, date, week, month, quarter, year]

    convert_tz: no

    datatype: date

    sql: ${TABLE}.dss_snapshot_date ;;

  }

  measure: count {

    type: count

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

          WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${calculated_date} AS STRING

      ELSE CAST(${calculated_date} AS STRING)

      END ;;

  }





  dimension: period {

    hidden: yes

    type: string

    sql: case when ${calculated_date} >= ${filter_start_date_date} AND ${calculated_date} < ${filter_end_date_date} then 'CP'

                when ${calculated_date} >= ${previous_start_date} AND ${calculated_date} < ${filter_start_date_date} then 'PP'

      when ${calculated_date} >= ${previous_year_start_date} AND ${calculated_date} < ${previous_year_end_date}  then 'LY' end ;;

  }



  dimension: is_current_period {

    hidden: yes

    type: yesno

    sql: ${calculated_date} >= ${filter_start_date_date} AND ${calculated_date} < ${filter_end_date_date} ;;

  }



  dimension: is_previous_period {

    hidden: yes

    type: yesno

    sql: ${calculated_date} >= ${previous_start_date} AND ${calculated_date} < ${filter_start_date_date} ;;

  }



  dimension: day_of_week {

    label: "Day of Week_TransactionDate"

    type: string

    sql: FORMAT_TIMESTAMP('%A', ${calculated_date}) ;;

  }



  dimension: dynamic_timeframe_test {

    type: string

    sql:

        CASE

          WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${calculated_date} AS STRING END ;;

  }



  dimension: period_test {

    hidden: yes

    type: string

    sql: case when ${calculated_date} >= ${filter_start_date_date} AND ${calculated_date} < ${filter_end_date_date} then 'CP'

                when ${calculated_date} >= ${previous_start_date} AND ${calculated_date} < ${filter_start_date_date} then 'PP'

      when ${calculated_date} >= ${previous_year_start_date} AND ${calculated_date} < ${previous_year_end_date}  then 'LY' end ;;

  }



  dimension: is_current_period_test {

    hidden: yes

    type: yesno

    sql: ${calculated_date} >= ${filter_start_date_date} AND ${calculated_date} < ${filter_end_date_date} ;;

  }



  dimension: is_previous_period_test {

    hidden: yes

    type: yesno

    sql: ${calculated_date} >= ${previous_start_date} AND ${calculated_date} < ${filter_start_date_date} ;;

  }



  dimension: day_of_week_test {

    label: "Day of Week_TraderOrderDate"

    type: string

    sql: FORMAT_TIMESTAMP('%A', ${calculated_date}) ;;

  }





}
