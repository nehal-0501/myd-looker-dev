view: wmp_design {

  sql_table_name: `gcp-wow-rwds-ai-bi-prod.view_market_plus.wmp_orders` ;;

  dimension: text_i_trade_i_GTV{
    type: string
    sql: "GTV EX GST" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_transactions{
    type: string
    sql: "# of Transactions" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_AOV{
    type: string
    sql: "AOV" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_GMV{
    type: string
    sql: "GMV EX GST" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_units_sold{
    type: string
    sql: "Units Sold" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_ASP{
    type: string
    sql: "ASP" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_GFV{
    type: string
    sql: "GFV EX GST" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_commission{
    type: string
    sql: "Commission" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_trade_i_commission_rate{
    type: string
    sql: "Commission Rate" ;;
    html: <p style="color: #1A73E8; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_product_i_sku_liquidity{
    type: string
    sql: "SKU Liquidity" ;;
    html: <p style="color: #1971ED; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_product_i_sku_sale{
    type: string
    sql: "SKUs with a Sale" ;;
    html: <p style="color: #1971ED; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_product_i_buyable_sku{
    type: string
    sql: "Buyable SKUs" ;;
    html: <p style="color: #1971ED; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_product_i_active_sku{
    type: string
    sql: "Active SKUs" ;;
    html: <p style="color: #1971ED; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_product_i_OOS{
    type: string
    sql: "Out of Stock" ;;
    html: <p style="color: #1971ED; font-family: Roboto; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_seller_i_seller_liquidity{
    type: string
    sql: "Seller Liquidity" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_seller_i_seller_sale{
    type: string
    sql: "Seller with a Sale" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }
  dimension: text_i_seller_i_active_sellers{
    type: string
    sql: "Active Sellers" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }
  dimension: text_i_seller_i_new_sellers{
    type: string
    sql: "New Sellers" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }
  dimension: text_i_seller_i_go_live_sellers{
    type: string
    sql: "Go-Live Sellers" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }
  dimension: text_i_customer_i_shoppers{
    type: string
    sql: "# of Shoppers" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_customer_i_members{
    type: string
    sql: "# of Members" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_customer_i_member_ratio{
    type: string
    sql: "% of Members" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_shipping_i_edd_accuracy{
    type: string
    sql: "EDD Accuracy" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_shipping_i_delivered_7_day{
    type: string
    sql: "Delivered Within 7 Days" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_shipping_i_avg_delivery{
    type: string
    sql: "Avg. Total Delivery Time" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_shipping_i_ontime_dispatch{
    type: string
    sql: "On-time Dispatch" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_shipping_i_scan_rate{
    type: string
    sql: "Scan Rate" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_CS_i_contact_to_order{
    type: string
    sql: "Contact to Order %" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_CS_i_CSAT{
    type: string
    sql: "CSAT" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_CS_i_avg_resolution{
    type: string
    sql: "Avg. Resolution Days" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_CS_i_escalation_rate{
    type: string
    sql: "Escalation Rate" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }}</p>;;
  }

  dimension: text_i_your_metrics{
    type: string
    sql: "Your Metric" ;;
    html: <p style="color: #1971ED; font-family: Lucida Console; font-size:80%; text-align:center"> {{ rendered_value }} <img src="https://img.icons8.com/?size=100&id=jyznmXqzcrM0&format=png&color=000000" height=25 width=25 style="margin-right: 2px;"> </p>;;
  }

  dimension: logo_i_S_i_WMP{
    type: string
    sql: "" ;;
    html: <p style="color: #1A73E8; font-family: Lucida Console; font-size:80%; text-align:center"> <img src="https://drive.google.com/thumbnail?id=1D-K8MsxZMyP2OLa3JCoqdRjbsBR5trOg" height=25 width=75 style="margin-right: 2px;"> </p>;;
  }

  dimension: logo_i_S_i_BWM{
    type: string
    sql: "" ;;
    html: <p style="color: #1A73E8; font-family: Lucida Console; font-size:80%; text-align:center"> <img src="https://drive.google.com/thumbnail?id=1HCcARhGPFMIjzf0aH17G6AoiW6OxTGBr" height=50 width=50 style="margin-right: 2px;"> </p>;;
  }

  dimension: logo_i_S_i_EDM{
    type: string
    sql: "" ;;
    html: <p style="color: #1A73E8; font-family: Lucida Console; font-size:80%; text-align:center"> <img src="https://drive.google.com/thumbnail?id=1QmTSzIxC5IQqd9Wf_nNO8Md7z4774amI" height=65 width=65 style="margin-right: 2px; margin-top: 2px;"> </p>;;
  }

  dimension: logo_i_S_i_MYD{
    type: string
    sql: "" ;;
    html: <p style="color: #1A73E8; font-family: Lucida Console; font-size:80%; text-align:center"> <img src="https://drive.google.com/thumbnail?id=1hTwJ6Ew3JXUz_YE5J3CbaNSYUXMepppR" height=20 width=75 style="margin-right: 2px; margin-top: 2px;"> </p>;;
  }

  dimension: logo_i_S_i_EDRS{
    type: string
    sql: "" ;;
    html: <p style="color: #1A73E8; font-family: Lucida Console; font-size:80%; text-align:center"> <img src="https://drive.google.com/thumbnail?id=1deTNxdQ3QtcE6GSpVTwLqmJPaMvnskgF" height=25 width=75 style="margin-right: 2px; margin-top: 2px;"> </p>;;
  }

  dimension_group: order {
    type: time
    convert_tz: no
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.order_date ;;
  }

  measure: text_period{
    type: string
    sql: concat('The current reporting week is from ', FORMAT_TIMESTAMP('%d/%m/%Y', MIN(${order_date})),' to ', FORMAT_TIMESTAMP('%d/%m/%Y', MAX(${order_date}))) ;;
    html:  <p style="color: #878787;font-family: Lucida Console; font-size:90%">{{ rendered_value }}</p>;;
  }

}
