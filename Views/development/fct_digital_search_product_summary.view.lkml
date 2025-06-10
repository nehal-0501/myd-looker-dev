include: "popanalysis.view"
view: fct_digital_search_product_summary {
  extends: [popanalysis]
  sql_table_name: `gcp-wow-wmp-ai-data-dev.dbt_aitil.fct_digital_search_product_summary` ;;

  dimension: add_to_cart_sessions {
    type: number
    description: "The count of unique sessions where the product was added to the cart directly from the search results page."
    sql: ${TABLE}.add_to_cart_sessions ;;
  }
  dimension: add_to_carts {
    type: number
    description: "The total number of times the product was added to the cart directly from the search results page."
    sql: ${TABLE}.add_to_carts ;;
  }
  dimension: attributed_add_to_cart_sessions {
    type: number
    description: "The total count of unique sessions where the product was added to the cart, attributed to this search keyword. This includes additions from the search page and other pages (if applicable based on attribution logic)."
    sql: ${TABLE}.attributed_add_to_cart_sessions ;;
  }
  dimension: attributed_add_to_carts {
    type: number
    description: "The total number of times the product was added to the cart, attributed to this search keyword. This includes additions from the search page and other pages (if applicable based on attribution logic)."
    sql: ${TABLE}.attributed_add_to_carts ;;
  }
  dimension: attributed_purchase_revenue {
    type: number
    description: "The total revenue generated from purchases of the product that are attributed to this search keyword."
    sql: ${TABLE}.attributed_purchase_revenue ;;
  }
  dimension: attributed_purchase_sessions {
    type: number
    description: "The count of unique sessions that resulted in a purchase of the product, attributed to this search keyword."
    sql: ${TABLE}.attributed_purchase_sessions ;;
  }
  dimension: attributed_purchases {
    type: number
    description: "The total number of times the product was purchased, attributed to this search keyword."
    sql: ${TABLE}.attributed_purchases ;;
  }
  dimension: banner {
    type: string
    description: "The marketplace where the order was placed"
    sql: ${TABLE}.banner ;;
  }
  dimension: banner_product_id {
    type: string
    description: "The product identifier as sourced from the banner's system (e.g., BIGW's internal ID)."
    sql: ${TABLE}.banner_product_id ;;
  }
  dimension: click_sessions {
    type: number
    description: "The count of unique sessions that involved a click on the product directly from the search results page."
    sql: ${TABLE}.click_sessions ;;
  }
  dimension: clicks {
    type: number
    description: "The total number of clicks on the product that occurred on the search results page."
    sql: ${TABLE}.clicks ;;
  }
  dimension_group: event {
    type: time
    description: "The date on which the events occurred, based on the Australia/Sydney timezone. This model is partitioned by this field."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }
  dimension: impression_sessions {
    type: number
    description: "The total count of unique sessions that performed a search for this keyword and viewed product in the search results page."
    sql: ${TABLE}.impression_sessions ;;
  }
  dimension: impression_sessions_page_1 {
    type: number
    description: "The total count of unique sessions where the search for this keyword resulted in viewing page 1 of the search results."
    sql: ${TABLE}.impression_sessions_page_1 ;;
  }
  dimension: impression_sessions_page_2 {
    type: number
    description: "The total count of unique sessions where the search for this keyword resulted in viewing page 2 of the search results."
    sql: ${TABLE}.impression_sessions_page_2 ;;
  }
  dimension: impression_sessions_page_3_to_5 {
    type: number
    description: "The total count of unique sessions where the search for this keyword resulted in viewing pages 3 to 5 of the search results."
    sql: ${TABLE}.impression_sessions_page_3_to_5 ;;
  }
  dimension: impression_sessions_page_6_plus {
    type: number
    description: "The total count of unique sessions where the search for this keyword resulted in viewing page 6 or subsequent pages of the search results."
    sql: ${TABLE}.impression_sessions_page_6_plus ;;
  }
  dimension: impression_sessions_top_10_position {
    type: number
    description: "The total number of sessions the product was impressed (displayed) within the top 10 positions on the search results page for a given keyword."
    sql: ${TABLE}.impression_sessions_top_10_position ;;
  }
  dimension: impression_sessions_top_5_position {
    type: number
    description: "The total number of sessions the product was impressed (displayed) within the top 5 positions on the search results page for a given keyword."
    sql: ${TABLE}.impression_sessions_top_5_position ;;
  }
  dimension: impressions {
    type: number
    description: "The total number of times a product was displayed (impressed) on the search results page for this keyword."
    sql: ${TABLE}.impressions ;;
  }
  dimension: impressions_page_1 {
    type: number
    description: "The total count of search impressions for the product that occurred on the first page of search results."
    sql: ${TABLE}.impressions_page_1 ;;
  }
  dimension: impressions_page_2 {
    type: number
    description: "The total count of search impressions for the product that occurred on the second page of search results."
    sql: ${TABLE}.impressions_page_2 ;;
  }
  dimension: impressions_page_3_to_5 {
    type: number
    description: "The total count of search impressions for the product that occurred between pages three and five of search results."
    sql: ${TABLE}.impressions_page_3_to_5 ;;
  }
  dimension: impressions_page_6_plus {
    type: number
    description: "The total count of search impressions for the product that occurred on page six or any subsequent page of search results."
    sql: ${TABLE}.impressions_page_6_plus ;;
  }
  dimension: impressions_top_10_position {
    type: number
    description: "The total number of times the product was impressed (displayed) within the top 10 positions on the search results page for a given keyword."
    sql: ${TABLE}.impressions_top_10_position ;;
  }
  dimension: impressions_top_5_position {
    type: number
    description: "The total number of times the product was impressed (displayed) within the top 5 positions on the search results page for a given keyword."
    sql: ${TABLE}.impressions_top_5_position ;;
  }
  dimension: pdp_click_sessions {
    type: number
    description: "The count of unique sessions where a product was selected (e.g., clicked to view details) directly from the search results page."
    sql: ${TABLE}.pdp_click_sessions ;;
  }
  dimension: pdp_clicks {
    type: number
    description: "The total number of times the product was selected (e.g., clicked to view details) directly from the search results page."
    sql: ${TABLE}.pdp_clicks ;;
  }
  dimension: platform {
    type: string
    description: "The platform where the event originated, for example, 'Web'."
    sql: ${TABLE}.platform ;;
  }
  dimension: product_id {
    type: string
    description: "The external product identifier used for market reporting, mapped from the banner product ID."
    sql: ${TABLE}.product_id ;;
  }
  dimension: search_keyword {
    type: string
    description: "The normalized search term entered by the user."
    sql: ${TABLE}.search_keyword ;;
  }
  measure: count {
    type: count
  }

  measure: count_search_activity_edm {
    type: sum
    sql: case when ${product_id} is not null then ${impression_sessions} else 0 end ;;
  }

  measure: count_search_activity {
    type: sum
    sql: ${impression_sessions} ;;
  }

  measure: unique_edm_products {
    type: count_distinct
    sql: ${product_id} ;;
  }

  # start dev space

  dimension: event_date_helper {
    type: string
    sql: cast(${TABLE}.event_date as date) ;;
    description: "The start time of the session with various time hierarchies."
  }

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
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${event_date_helper} AS STRING)
    ELSE CAST(${event_date_helper} AS STRING)
    END ;;
  }


  dimension: period {
    hidden: yes
    type: string
    sql: case when ${event_date_helper} >= ${filter_start_date_date} AND ${event_date_helper} < ${filter_end_date_date} then 'CP'
          when ${event_date_helper} >= ${previous_start_date} AND ${event_date_helper} < ${filter_start_date_date} then 'PP'
          when ${event_date_helper} >= ${previous_year_start_date} AND ${event_date_helper} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${event_date_helper} >= ${filter_start_date_date} AND ${event_date_helper} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${event_date_helper} >= ${previous_start_date} AND ${event_date_helper} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${event_date_helper}) ;;
  }

  dimension: dynamic_timeframe_test {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${event_date_helper} AS STRING END ;;
  }

  dimension: period_test {
    hidden: yes
    type: string
    sql: case when ${event_date_helper} >= ${filter_start_date_date} AND ${event_date_helper} < ${filter_end_date_date} then 'CP'
          when ${event_date_helper} >= ${previous_start_date} AND ${event_date_helper} < ${filter_start_date_date} then 'PP'
          when ${event_date_helper} >= ${previous_year_start_date} AND ${event_date_helper} < ${previous_year_end_date}  then 'LY' end ;;
  }

  dimension: is_current_period_test {
    hidden: yes
    type: yesno
    sql: ${event_date_helper} >= ${filter_start_date_date} AND ${event_date_helper} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period_test {
    hidden: yes
    type: yesno
    sql: ${event_date_helper} >= ${previous_start_date} AND ${event_date_helper} < ${filter_start_date_date} ;;
  }

  dimension: day_of_week_test {
    label: "Day of Week_TraderOrderDate"
    type: string
    sql: FORMAT_TIMESTAMP('%A', ${event_date_helper}) ;;
  }


}
