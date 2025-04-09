view: mart_zendesk_ticket_call_and_cost {
  sql_table_name: `dbt_martin.mart_zendesk_ticket_call_and_cost` ;;

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: call_id {
    type: string
    sql: ${TABLE}.call_id ;;
  }

  dimension: start_time {
    type: date_time
    sql: ${TABLE}.start_time ;;
  }

  dimension: end_time {
    type: date_time
    sql: ${TABLE}.end_time ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: created_at {
    type: date_time
    sql: ${TABLE}.created_at ;;
  }

  dimension: updated_at {
    type: date_time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: cal_ticket_valid {
    type: yesno
    sql: ${TABLE}.cal_ticket_valid ;;
  }

  dimension: first_public_reply_at {
    type: date_time
    sql: ${TABLE}.first_public_reply_at ;;
  }

  dimension: ticket_created_at {
    type: date_time
    sql: ${TABLE}.created_at ;;
  }

  measure: total_cost {
    type: sum
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }

  measure: average_duration_seconds {
    type: average
    sql: ${TABLE}.duration_seconds ;;
  }

  measure: total_duration_seconds {
    type: sum
    sql: ${TABLE}.duration_seconds ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket_id, call_id]
  }

  measure: first_response_hours {
    type: number
    sql: CASE
           WHEN ${cal_ticket_valid} = TRUE AND ${first_public_reply_at} IS NOT NULL THEN
             TIMESTAMP_DIFF(
               ${first_public_reply_at},
               ${ticket_created_at},
               HOUR
             )
           ELSE NULL
      END
    description: "Calculates the time difference in hours between ticket creation and first public reply for valid tickets."
    value_format_name: decimal_0 # Optional: Formats the number as an integer
  }

  dimension_group: start_time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: end_time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_time ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: first_public_reply {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_public_reply_at ;;
  }

  dimension_group: ticket_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
}
