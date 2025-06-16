view: popanalysis {

  extension: required

  filter: date_filter {
    view_label: "_PoP"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
    convert_tz: no
  }

  filter: date_filter_test {
    view_label: "_PoP"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
    convert_tz: no
  }

  dimension_group: filter_start_date {
    hidden: yes
    type: time
    timeframes: [raw,date]
    convert_tz: no
    sql: case when {% date_start date_filter %} IS NULL THEN '2021-03-06' ELSE DATE({% date_start date_filter %}, 'Australia/Melbourne') END ;;
  }

  dimension_group: filter_end_date {
    hidden: yes
    type: time
    timeframes: [raw,date]
    convert_tz: no
    sql: case when {% date_end date_filter %} IS NULL THEN CURRENT_DATE('Australia/Melbourne') ELSE DATE({% date_end date_filter %}, 'Australia/Melbourne') END ;;
  }

# --- NEW: filter_start_date for 'test' fields ---
  dimension_group: filter_start_date_test {
    hidden: yes # Keep this hidden as it's a derived value
    type: time
    timeframes: [raw,date]
    convert_tz: no
    sql: case when {% date_start date_filter_test %} IS NULL THEN '2021-03-06' ELSE DATE({% date_start date_filter_test %}, 'Australia/Melbourne') END  ;;
  }

  # --- NEW: filter_end_date for 'test' fields ---
  dimension_group: filter_end_date_test {
    hidden: yes # Keep this hidden
    type: time
    timeframes: [raw,date]
    convert_tz: no
    sql: case when {% date_end date_filter_test %} IS NULL THEN CURRENT_DATE('Australia/Melbourne') ELSE DATE({% date_end date_filter_test %}, 'Australia/Melbourne') END ;;
  }


  dimension: interval {
    hidden: yes
    type: number
    sql: DATE_DIFF(${filter_start_date_date},${filter_end_date_date},DAY) ;;
  }

# --- NEW: interval for 'test' fields ---
  dimension: interval_test {
    hidden: yes
    type: number
    sql: DATE_DIFF(${filter_start_date_test_date},${filter_end_date_test_date},DAY) ;;
  }

  dimension: previous_start_date {
    hidden: yes
    type: string
    sql: DATE_ADD(CAST(${filter_start_date_date} AS date),INTERVAL ${interval} DAY) ;;
  }

  dimension: previous_start_date_test {
    hidden: yes
    type: string
    sql: DATE_ADD(CAST(${filter_start_date_test_date} AS date),INTERVAL ${interval_test} DAY) ;;
  }


  #start dev space
  dimension: previous_year_start_date {
    view_label: "_PoP"
    hidden: yes
    type: string
    sql: DATE_ADD(CAST(${filter_start_date_date} AS date),INTERVAL -1 YEAR) ;;
  }

  dimension: previous_year_start_date_test {
    view_label: "_PoP"
    hidden: yes
    type: string
    sql: DATE_ADD(CAST(${filter_start_date_test_date} AS date),INTERVAL -1 YEAR) ;;
  }

  dimension: previous_year_end_date {
    view_label: "_PoP"
    hidden: yes
    type: string
    sql: DATE_ADD(CAST(${filter_end_date_date} AS date),INTERVAL -1 YEAR) ;;
  }

  dimension: previous_year_end_date_test {
    view_label: "_PoP"
    hidden: yes
    type: string
    sql: DATE_ADD(CAST(${filter_end_date_test_date} AS date),INTERVAL -1 YEAR) ;;
  }


  dimension: timeframes {
    view_label: "_PoP"
    type: string
    case: {
      when: {
        sql: ${period} = 'CP';;
        label: "Selected Period"
      }
      when: {
        sql: ${period} = 'PP';;
        label: "Previous Period"
      }
      when: {
        sql: ${period} = 'LY';;
        label: "Same Period Last Year"
      }
      else: "Not in time period"
    }
  }

  dimension: timeframes_test {
    view_label: "_PoP"
    type: string
    case: {
      when: {
        sql:  ${period_test} = 'CP';;
        label: "Selected Period"
      }
      when: {
        sql: ${period_test} = 'PP';;
        label: "Previous Period"
      }
      when: {
        sql: ${period_test} = 'LY';;
        label: "Same Period Last Year"
      }
      else: "Not in time period"
    }
  }

  dimension: timeframes_prior_period_test {
    view_label: "_PoP"
    type: string
    hidden: yes
    case: {
      when: {
        sql:  ${is_current_period_test} = true;;
        label: "Selected Period"
      }
      when: {
        sql:  ${is_previous_period_test} = true;;
        label: "Previous Period"
      }
      else: "Not in time period"
    }
  }



  #end dev space


  dimension: timeframes_prior_period {
    view_label: "_PoP"
    type: string
    hidden: yes
    case: {
      when: {
        sql: ${is_current_period} = true ;;
        label: "Selected Period"
      }
      when: {
        sql: ${is_previous_period} = true ;;
        label: "Previous Period"
      }
      else: "Not in time period"
    }
  }

}
