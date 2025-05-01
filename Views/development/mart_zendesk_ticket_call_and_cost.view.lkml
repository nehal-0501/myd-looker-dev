include: "popanalysis.view"
view: mart_zendesk_ticket_call_and_cost {
  extends: [popanalysis]
  sql_table_name: `mart_customer_service.mart_zendesk_ticket_call_and_cost` ;;

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: call_id {
    type: string
    sql: ${TABLE}.call_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: call_completion_status {
    type: string
    sql: ${TABLE}.call_completion_status ;;
  }

  dimension: call_direction {
    type: string
    sql: ${TABLE}.call_direction ;;
  }

  dimension: _is_call_ivr_involved  {
    type: yesno
    sql: ${TABLE}._is_call_ivr_involved  ;;
  }

  dimension: _is_not_answered_call  {
    type: yesno
    sql: ${TABLE}._is_not_answered_call  ;;
  }

  dimension: ticket_created_at {
    type: date_time
    sql: ${TABLE}.ticket_created_at ;;
  }


  dimension: ticket_created_at_timestamp {
    type: date_time
    sql:cast(FORMAT_TIMESTAMP('%Y-%m-%dT%H:%M:%E6S', CAST(${TABLE}.ticket_created_at AS TIMESTAMP)) as string) ;;
  }

  dimension_group: ticket_created_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ticket_created_at ;;
  }

  dimension: ticket_solved_at {
    type: date_time
    sql: ${TABLE}.ticket_solved_at ;;
  }

  dimension: seller_id {
    type: number
    sql: ${TABLE}.seller_id ;;
  }

  dimension: crm_order_id {
    type: string
    sql: ${TABLE}.crm_order_id ;;
  }

  dimension: mp_order_id {
    type: string
    sql: ${TABLE}.mp_order_id ;;
  }

  dimension: big_w_order_id {
    type: string
    sql: ${TABLE}.big_w_order_id ;;
  }

  dimension: _is_delete_me_ticket {
    type: yesno
    sql: ${TABLE}._is_delete_me_ticket ;;
  }

  dimension: _is_hidden_ticket {
    type: yesno
    sql: ${TABLE}._is_hidden_ticket ;;
  }

  dimension: _is_customer_escalation {
    type: yesno
    sql: ${TABLE}._is_customer_escalation ;;
  }

  dimension: _is_seller_ticket_edm {
    type: yesno
    sql: ${TABLE}._is_seller_ticket_edm ;;
  }

  dimension: _is_seller_enquiry {
    type: yesno
    sql: ${TABLE}._is_seller_enquiry ;;
  }

  dimension: csat_score {
    type: string
    sql: ${TABLE}.csat_score ;;
  }

  dimension: ticket_group {
    type: string
    sql: ${TABLE}.ticket_group ;;
  }

  dimension: crm_seller_id {
    type: number
    sql: ${TABLE}.crm_seller_id ;;
  }

  dimension: crm_seller_name {
    type: string
    sql: ${TABLE}.crm_seller_name ;;
  }

  dimension: seller_name {
    type: string
    sql: ${TABLE}.seller_name ;;
  }

  dimension: crm_seller_name_based_on_mp_seller_id {
    type: string
    sql: ${TABLE}.crm_seller_name_based_on_mp_seller_id ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: call_brand_name {
    type: string
    sql: ${TABLE}.call_brand_name ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: ticket_raised {
    type: string
    sql: ${TABLE}.ticket_raised ;;
  }

  dimension: _is_csat_survey_completed {
    type: yesno
    sql: ${TABLE}._is_csat_survey_completed ;;
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
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${ticket_created_at} AS STRING
    ELSE CAST(${ticket_created_at} AS STRING)
    END ;;
  }


  dimension: period {
    hidden: yes
    type: string
    sql: case when ${ticket_created_at} >= ${filter_start_date_date} AND ${ticket_created_at} < ${filter_end_date_date} then 'CP'
          when ${ticket_created_at} >= ${previous_start_date} AND ${ticket_created_at} < ${filter_start_date_date} then 'PP'
          when ${ticket_created_at} >= ${previous_year_start_date} AND ${ticket_created_at} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${ticket_created_at} >= ${filter_start_date_date} AND ${ticket_created_at} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${ticket_created_at} >= ${previous_start_date} AND ${ticket_created_at} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${ticket_created_at}) ;;
  }

  measure: ticket_count {
    type: count_distinct
    sql: case when ${brand_name} in ( 'Big W Market', 'Everyday Market', 'Everyday Rewards Shop','MyDeal' ) and
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
   and ${_is_delete_me_ticket} = FALSE
   and ${_is_hidden_ticket} = FALSE
   and ${_is_seller_ticket_edm} = FALSE
   and ${_is_customer_escalation} = FALSE
   and ${_is_seller_enquiry} = FALSE
   and ${status} != 'deleted'
   and ${channel} != 'voice'
  then ${ticket_id} end  ;;
  }

  measure: ticket_escalation_count {
    type: count_distinct
    sql: case when ${brand_name} in ( 'Big W Market', 'Everyday Market', 'Everyday Rewards Shop','MyDeal' ) and
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
         and ${_is_delete_me_ticket} = FALSE
         and ${_is_hidden_ticket} = FALSE
         and ${_is_seller_ticket_edm} = FALSE
         and ${_is_customer_escalation}
         and ${_is_seller_enquiry} = FALSE
         and ${status} != 'deleted'
        then ${ticket_id} end  ;;
  }

  measure: positive_csat_response {
    type: count_distinct
    sql: case when ${brand_name} in ( 'Big W Market', 'Everyday Market', 'Everyday Rewards Shop','MyDeal' ) and
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
         and ${_is_delete_me_ticket} = FALSE
         and ${_is_hidden_ticket} = FALSE
         and ${_is_seller_ticket_edm} = FALSE
         and ${_is_customer_escalation} = FALSE
         and ${_is_seller_enquiry} = FALSE
         and ${status} != 'deleted'
         and ${csat_score} = 'good'
        then ${ticket_id} end  ;;
  }

  measure: total_csat_response {
    type: count_distinct
    sql: case when ${brand_name} in ( 'Big W Market', 'Everyday Market', 'Everyday Rewards Shop','MyDeal' ) and
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
         and ${_is_delete_me_ticket} = FALSE
         and ${_is_hidden_ticket} = FALSE
         and ${_is_seller_ticket_edm} = FALSE
         and ${_is_customer_escalation} = FALSE
         and ${_is_seller_enquiry} = FALSE
         and ${status} != 'deleted'
         and ${_is_csat_survey_completed}
        then ${ticket_id} end  ;;
  }

  measure: call_count {
    type: count_distinct
    sql: case
           when ${call_direction} = 'inbound'
            and ${call_completion_status} NOT IN ('failed', 'abandoned_in_queue')
            and ${_is_call_ivr_involved} = FALSE
            and ${_is_not_answered_call} = FALSE
           then ${call_id} end  ;;
  }

  measure: time_to_resolution_days {
    type: sum
    sql:  date_diff(${ticket_solved_at} , ${ticket_created_at} , day) ;;
  }

}
