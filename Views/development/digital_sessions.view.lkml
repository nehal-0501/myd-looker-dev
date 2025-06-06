include: "popanalysis.view"
view: digital_sessions {
  extends: [popanalysis]
  sql_table_name: `dbt_aitil.obt_digital_session_conversions` ;;


  dimension: dw_session_id {
    primary_key: yes
    sql: ${TABLE}.dw_session_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    description: "The unique user ID."
  }

  dimension: wxid {
    type: string
    sql: ${TABLE}.wxid ;;
    description: "The unique session ID."
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    description: "The unique session key."
  }

  dimension: dw_session_partition_id {
    type: string
    sql: ${TABLE}.dw_session_partition_id ;;
    description: "The unique session partition ID."
  }

  dimension: dw_client_id {
    type: string
    sql: ${TABLE}dw_.client_id ;;
    description: "The client ID."
  }

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
    description: "The banner ID."
  }

  dimension: hashed_crn {
    type: string
    sql: ${TABLE}.hashed_crn ;;
    description: "The banner ID."
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
    description: "The platform used (e.g., web, mobile)."
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
    description: "The category of the device (e.g., desktop, mobile)."
  }

  dimension: device_mobile_type {
    type: string
    sql: ${TABLE}.device_mobile_type ;;
    description: "The type of mobile device (e.g., iPhone, Android)."
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
    description: "The country of the user's location."
  }

  dimension: session_source {
    type: string
    sql: ${TABLE}.session_source ;;
    description: "The banner associated with the session or product interaction."
  }

  dimension: session_medium {
    type: string
    sql: ${TABLE}.session_source ;;
    description: "The banner associated with the session or product interaction."
  }

  dimension: session_campaign {
    type: string
    sql: ${TABLE}.session_campaign ;;
    description: "The banner associated with the session or product interaction."
  }

  dimension: session_channel {
    type: string
    sql: ${TABLE}.session_campaign ;;
    description: "The banner associated with the session or product interaction."
  }

  dimension: last_non_direct_channel {
    type: string
    sql: ${TABLE}.session_campaign ;;
    description: "The banner associated with the session or product interaction."
  }

  dimension_group: session_partition_start_time {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.session_partition_start_time ;;
    description: "The start time of the session with various time hierarchies."
  }

  dimension: session_partition_date {
    type: date_time
    sql: cast(${TABLE}.session_partition_date as timestamp) ;;
    description: "The start time of the session with various time hierarchies."
  }

  dimension: session_partition_date_helper {
    type: string
    sql: cast(${TABLE}.session_partition_date as date) ;;
    description: "The start time of the session with various time hierarchies."
  }

  measure: session_count {
    type: count_distinct
    sql: ${session_id}  ;;
    description: "The number of sessions."
  }



  dimension: productinteractions {hidden:yes}

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
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${session_partition_date_helper} AS STRING
    ELSE CAST(${session_partition_date_helper} AS STRING)
    END ;;
  }


  dimension: period {
    hidden: yes
    type: string
    sql: case when ${session_partition_date_helper} >= ${filter_start_date_date} AND ${session_partition_date_helper} < ${filter_end_date_date} then 'CP'
          when ${session_partition_date_helper} >= ${previous_start_date} AND ${session_partition_date_helper} < ${filter_start_date_date} then 'PP'
          when ${session_partition_date_helper} >= ${previous_year_start_date} AND ${session_partition_date_helper} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${session_partition_date_helper} >= ${filter_start_date_date} AND ${session_partition_date_helper} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${session_partition_date_helper} >= ${previous_start_date} AND ${session_partition_date_helper} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${session_partition_date_helper}) ;;
  }

}
