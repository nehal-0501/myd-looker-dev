view: mart_zendesk_ticket_call_and_cost {
  sql_table_name: `mart_customer_service.mart_zendesk_ticket_call_and_cost` ;;

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  dimension_group: ticket_created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ticket_created_at ;;
  }

  dimension: ticket_solved_at {
    type: string
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
    type: number
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

  dimension: call_brand_name {
    type: string
    sql: ${TABLE}.call_brand_name ;;
  }

  dimension: ticket_raised {
    type: string
    sql: ${TABLE}.ticket_raised ;;
  }




}
