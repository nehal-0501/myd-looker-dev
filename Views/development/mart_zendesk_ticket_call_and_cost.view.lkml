view: mart_zendesk_ticket_call_and_cost {
  sql_table_name: `mart_customer_service.mart_zendesk_ticket_call_and_cost` ;;

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

  dimension: ticket_created_at {
    type: string
    sql: ${TABLE}.ticket_created_at ;;
  }

  dimension: first_public_reply_at {
    type: string
    sql: ${TABLE}.first_public_reply_at ;;
  }

  dimension: first_public_reply_at_date_time {
    type: date_time
    sql: ${TABLE}.first_public_reply_at ;;
  }

  dimension: updated_at {
    type: date_time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: _is_delete_me_ticket {
    type: yesno
    sql: ${TABLE}._is_delete_me_ticket ;;
    description: "Indicates if the ticket is marked for deletion."
  }

  dimension: _is_hidden_ticket {
    type: yesno
    sql: ${TABLE}._is_hidden_ticket ;;
    description: "Indicates if the ticket is hidden."
  }

  dimension: _is_seller_ticket_edm {
    type: yesno
    sql: ${TABLE}._is_seller_ticket_edm ;;
    description: "Indicates if the ticket is a seller ticket from EDM."
  }

  dimension: _is_customer_escalation {
    type: yesno
    sql: ${TABLE}._is_customer_escalation ;;
    description: "Indicates if the ticket is a customer escalation."
  }

  dimension: _is_seller_enquiry {
    type: yesno
    sql: ${TABLE}._is_seller_enquiry ;;
    description: "Indicates if the ticket is a seller enquiry."
  }

  dimension: ticket_group {
    type: string
    sql: ${TABLE}.ticket_group ;;
    description: "The group assigned to the ticket."
  }


  dimension: cal_ticket_valid {
    type: yesno
    sql: IF(
          ${ticket_group} IN (
            'All users (default group)',
            'BIG W Market',
            'Escalations',
            'Everyday Market',
            'Everyday Rewards Shop',
            'MyDeal Group',
            'Payment Disputes',
            'Predelivery',
            'Presales',
            'seller',
            'Seller Group',
            'Supervisor',
            'WMP Commercial (1P) Customer Service'
          )
          AND ${_is_delete_me_ticket} = FALSE
          AND ${_is_hidden_ticket} = FALSE
          AND ${_is_seller_ticket_edm} = FALSE
          AND ${_is_customer_escalation} = FALSE
          AND ${_is_seller_enquiry} = FALSE,
          TRUE,
          FALSE
        ) ;;
    description: "Indicates if the ticket is considered valid based on group and other criteria."
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

  measure: average_first_response_hours {
    type: average
    sql:  TIMESTAMP_DIFF(
            ${first_public_reply_at},
            ${ticket_created_at},
            HOUR
          );;
    # value_format: "#.00"  # Optional: Formats the output to 2 decimal places
    description: "Average number of hours for the first response (considering valid tickets and first reply)."
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
    sql: ${TABLE}.ticket_created_at ;;
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
    sql: ${TABLE}.ticket_created_at ;;
  }
}
