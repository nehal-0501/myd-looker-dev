include: "popanalysis.view"
view: wmp_customer_service {
  extends: [popanalysis]
  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_customer_service` ;;

  dimension: _is_csat_survey_completed {
    type: yesno
    sql: ${TABLE}._is_csat_survey_completed ;;
  }
  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: seller_id {
    type: string
    sql: ${TABLE}.seller_id ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: enquiry_type {
    type: string
    sql: ${TABLE}.enquiry_type ;;
  }

  dimension: enquiry_type_group {
    type: string
    sql: ${TABLE}.enquiry_type_group ;;
  }

  dimension: ticket_status {
    type: string
    sql: ${TABLE}.ticket_status ;;
  }

# Date Fields

  dimension: ticket_created_at_string {
    type: string
    sql: cast(${TABLE}.ticket_created_at as date) ;;
  }

  dimension: ticket_solved_at_string {
    type: string
    sql: cast(${TABLE}.ticket_solved_at as date) ;;
  }

  dimension: call_created_at_string {
    type: string
    sql: cast(${TABLE}.call_created_at as date) ;;
  }

  dimension: contact_created_at {
    type: string
    sql: coalesce(${ticket_created_at_string}, ${call_created_at_string}) ;;
  }

  measure: time_to_resolution_days {
    type: sum
    sql:  date_diff(${ticket_solved_at_string} , ${ticket_created_at_string} , day) ;;
  }

  dimension_group: call_created {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.call_created_at ;;
  }
  dimension: call_id {
    type: string
    sql: ${TABLE}.call_id ;;
  }
  dimension_group: contact_created {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.contact_created_at ;;
  }
  dimension: csat_score {
    type: string
    sql: ${TABLE}.csat_score ;;
  }
  dimension: seller_name {
    type: string
    sql: ${TABLE}.seller_name ;;
  }
  dimension_group: ticket_created {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.ticket_created_at ;;
  }
  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }
  dimension_group: ticket_solved {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.ticket_solved_at ;;
  }

  dimension: valid_call {
    type: yesno
    sql: ${TABLE}.valid_call ;;
  }
  dimension: valid_contact_ticket {
    type: yesno
    sql: ${TABLE}.valid_contact_ticket ;;
  }
  dimension: valid_ticket_all {
    type: yesno
    sql: ${TABLE}.valid_ticket_all ;;
  }
  dimension: valid_escalation_ticket {
    type: yesno
    sql: ${TABLE}.valid_escalation_ticket ;;
  }
  dimension: valid_ticket {
    type: yesno
    sql: ${TABLE}.valid_ticket ;;
  }


  measure: ticket_count {
    type: count_distinct
    sql: case when ${valid_ticket} then ${ticket_id} end  ;;
  }

  measure: ticket_escalation_count {
    type: count_distinct
    sql: case when ${valid_escalation_ticket} then ${ticket_id} end  ;;
  }
  measure: contact_ticket_count {
    type: count_distinct
    sql: case when ${valid_contact_ticket} then ${ticket_id} end  ;;
  }

  measure: positive_csat_response {
    type: count_distinct
    sql: case when ${valid_ticket_all} and ${csat_score} = 'good' then ${ticket_id} end  ;;
  }

  measure: total_csat_response {
    type: count_distinct
    sql: case  when ${valid_ticket_all} and ${_is_csat_survey_completed} then ${ticket_id} end  ;;
  }

  measure: call_count {
    type: count_distinct
    sql: case when valid_call
          and ${brand_name} in ( 'Big W Market', 'Everyday Market', 'Everyday Rewards Shop','MyDeal' )
           then ${call_id} end  ;;
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
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${contact_created_at} AS STRING )END ;;
  }

  dimension: dynamic_timeframe_test {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${ticket_solved_at_string} AS STRING ) END ;;
  }


  dimension: period {
    hidden: yes
    type: string
    sql: case when ${contact_created_at} >= ${filter_start_date_date} AND ${contact_created_at} < ${filter_end_date_date} then 'CP'
          when ${contact_created_at} >= ${previous_start_date} AND ${contact_created_at} < ${filter_start_date_date} then 'PP'
          when ${contact_created_at} >= ${previous_year_start_date} AND ${contact_created_at} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${contact_created_at} >= ${filter_start_date_date} AND ${contact_created_at} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${contact_created_at} >= ${previous_start_date} AND ${contact_created_at} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${contact_created_at}) ;;
  }

## Add New Filter



  dimension: period_test {
    hidden: yes
    type: string
    sql: case when ${ticket_solved_at_string} >= ${filter_start_date_test_date} AND ${ticket_solved_at_string} < ${filter_end_date_test_date} then 'CP'
          when ${ticket_solved_at_string} >= ${previous_start_date_test} AND ${ticket_solved_at_string} < ${filter_start_date_test_date} then 'PP'
          when ${ticket_solved_at_string} >= ${previous_year_start_date_test} AND ${ticket_solved_at_string} < ${previous_year_end_date_test}  then 'LY' end ;;
  }

  dimension: is_current_period_test {
    hidden: yes
    type: yesno
    sql: ${ticket_solved_at_string} >= ${filter_start_date_test_date} AND ${ticket_solved_at_string} < ${filter_end_date_test_date}date} ;;
  }

  dimension: is_previous_period_test {
    hidden: yes
    type: yesno
    sql: ${ticket_solved_at_string} >= ${previous_start_date_test} AND ${ticket_solved_at_string} < ${filter_start_date_test_date} ;;
  }

  dimension: day_of_week_test {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${is_current_period_test}) ;;
  }


}
