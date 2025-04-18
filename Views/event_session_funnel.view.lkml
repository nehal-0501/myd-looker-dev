view: event_session_funnel {
  derived_table: {
    sql: SELECT
          session_id
        , MIN(
            CASE WHEN
              event_type = 'Product'
              THEN created_at
              ELSE NULL END
            ) as event1_time
        , MIN(
            CASE WHEN
              event_type = 'Cart'
              THEN created_at
              ELSE NULL END
            ) as event2_time
        , MIN(
            CASE WHEN
              event_type = 'Purchase'
              THEN created_at
              ELSE NULL END
            ) as event3_time
      FROM `myd-dev-396904.looker_dev.events`
      GROUP BY 1
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: event1 {
    type: time
    timeframes: [raw, time]
    sql: ${TABLE}.event1_time ;;
  }

  dimension_group: event2 {
    type: time
    timeframes: [raw, time]
    sql: ${TABLE}.event2_time ;;
  }

  dimension_group: event3 {
    type: time
    timeframes: [raw, time]
    sql: ${TABLE}.event3_time ;;
  }

  dimension: event1_before_event2 {
    type: yesno
    sql: ${event1_time} < ${event2_time} ;;
  }

  dimension: event2_before_event3 {
    type: yesno
    sql: ${event2_time} < ${event3_time} ;;
  }

  dimension: time_in_funnel {
    type: number
    sql: datediff(min, ${event1_raw},COALESCE(${event3_raw},${event2_raw})) ;;
  }

  measure: count_sessions {
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: count_sessions_event1 {
    type: count_distinct
    sql: ${session_id} ;;

    filters: {
      field: event1_time
      value: "NOT NULL"
    }
  }

  measure: count_sessions_event12 {
    type: count_distinct
    sql: ${session_id} ;;

    filters: {
      field: event1_time
      value: "NOT NULL"
    }

    filters: {
      field: event2_time
      value: "NOT NULL"
    }

    filters: {
      field: event1_before_event2
      value: "yes"
    }
  }

  measure: count_sessions_event123 {
    type: count_distinct
    sql: ${session_id} ;;

    filters: {
      field: event1_time
      value: "NOT NULL"
    }

    filters: {
      field: event2_time
      value: "NOT NULL"
    }

    filters: {
      field: event3_time
      value: "NOT NULL"
    }

    filters: {
      field: event1_before_event2
      value: "yes"
    }

    filters: {
      field: event2_before_event3
      value: "yes"
    }
  }

  set: detail {
    fields: [session_id, event1_time, event2_time, event3_time]
  }
}
