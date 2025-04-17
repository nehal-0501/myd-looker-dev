view: digital_sessions {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #view: digital_sessions {
  sql_table_name: `dbt_aitil.fct_digital_sessions` ;; # Replace with your actual table name

  dimension: dw_visitor_id {
    type: string
    sql: ${TABLE}.dw_visitor_id ;;
    description: "The unique visitor ID."
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    description: "The unique session ID."
  }

  dimension: banner {
    type: string
    sql: ${TABLE}.banner ;;
    description: "The banner associated with the session."
  }

  dimension_group: session_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.session_start_time ;;
    description: "The start time of the session."
  }

  dimension_group: session_end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.session_end_time ;;
    description: "The end time of the session."
  }

  dimension: session_date {
    type: date
    sql: ${TABLE}.session_date ;;
    description: "The date of the session."
  }

  dimension: session_duration_seconds {
    type: number
    sql: ${TABLE}.session_duration_seconds ;;
    description: "The duration of the session in seconds."
  }

  dimension: is_marketplus_session {
    type: yesno
    sql: ${TABLE}.is_marketplus_session ;;
    description: "Indicates if the session was a Marketplus session (True/False)."
  }

  measure: total_sessions {
    type: count_distinct
    sql: ${session_id} ;;
    description: "Total number of unique sessions."
  }
}
