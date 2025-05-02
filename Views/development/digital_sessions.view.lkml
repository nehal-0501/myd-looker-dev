view: digital_sessions {

  sql_table_name: `dbt_aitil.obt_digital_session_product_interactions` ;;


  dimension: session_id {
    primary_key: yes
    sql: ${TABLE}.session_id ;;
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

  dimension: session_key {
    type: string
    sql: ${TABLE}.session_key ;;
    description: "The unique session key."
  }

  dimension: session_partition_key {
    type: string
    sql: ${TABLE}.session_partition_key ;;
    description: "The unique session partition ID."
  }

  dimension: client_key {
    type: string
    sql: ${TABLE}.client_key ;;
    description: "The client ID."
  }

  dimension: banner_key {
    type: string
    sql: ${TABLE}.banner_key ;;
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
    type: date
    sql: cast(${TABLE}.session_partition_date as date) ;;
    description: "The start time of the session with various time hierarchies."
  }

  measure: session_count {
    type: count_distinct
    sql: ${session_key}  ;;
    description: "The number of sessions."
  }

  dimension: productinteractions {hidden:yes}


}
