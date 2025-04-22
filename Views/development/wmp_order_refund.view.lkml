view: wmp_order_refund {
  sql_table_name: `wmp.wmp_order_refund` ;;

  dimension: fiscal_month {
    type: string
    sql: ${TABLE}.Fiscal_Month ;;
  }

  dimension: fiscal_week {
    type: number
    sql: ${TABLE}.Fiscal_Week ;;
  }

  dimension: profit_centre {
    type: string
    sql: ${TABLE}.ProfitCentre ;;
  }

  dimension: trader_order_id {
    type: string
    sql: ${TABLE}.TraderOrderId ;;
  }

  dimension: mp_order_id {
    type: string
    sql: ${TABLE}.MPOrderId ;;
  }

  dimension: invoice_id {
    type: string
    sql: ${TABLE}.InvoiceID ;;
  }

  dimension: trader_order_date {
    type: date
    sql: ${TABLE}.TraderOrderDate ;;
  }

  dimension: mp_order_date {
    type: date
    sql: ${TABLE}.MPOrderDate ;;
  }

  dimension: dispatch_date {
    type: date
    sql: ${TABLE}.DispatchDate ;;
  }

  dimension: promised_delivery_date_min {
    type: date
    sql: ${TABLE}.PromisedDeliveryDateMin ;;
  }

  dimension: promised_delivery_date_max {
    type: date
    sql: ${TABLE}.PromisedDeliveryDateMax ;;
  }

  dimension: seller_id {
    type: string
    sql: ${TABLE}.SellerId ;;
  }

  dimension: seller_name {
    type: string
    sql: ${TABLE}.SellerName ;;
  }

  dimension: wmp_seller {
    type: string
    sql: ${TABLE}.wmp_seller ;;
  }

  dimension: third_party_order_id {
    type: string
    sql: ${TABLE}.ThirdPartyOrderId ;;
  }

  dimension: third_party_name {
    type: string
    sql: ${TABLE}.ThirdPartyName ;;
  }

  dimension: sap_vendor_id {
    type: string
    sql: ${TABLE}.SapVendorId ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.Postcode ;;
  }

  dimension: trader_stock_code {
    type: string
    sql: ${TABLE}.TraderStockCode ;;
  }

  dimension: mp_article_number {
    type: string
    sql: ${TABLE}.MPArticleNumber ;;
  }

  dimension: variant_name {
    type: string
    sql: ${TABLE}.VariantName ;;
  }

  dimension: shopper_id {
    type: string
    sql: ${TABLE}.ShopperId ;;
  }

  dimension: mp_article_name {
    type: string
    sql: ${TABLE}.MPArticleName ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.Qty ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }

  dimension: line_total {
    type: number
    sql: ${TABLE}.LineTotal ;;
  }

  dimension: referral_fee {
    type: number
    sql: ${TABLE}.ReferralFee ;;
  }

  dimension: referral_fee_pct {
    type: number
    sql: ${TABLE}.ReferralFeePct ;;
  }

  dimension: shipping_fee_total {
    type: number
    sql: ${TABLE}.ShippingFeeTotal ;;
  }

  dimension: shipping_fee {
    type: number
    sql: ${TABLE}.ShippingFee ;;
  }

  dimension: gtv {
    type: number
    sql: ${TABLE}.GTV ;;
  }

  dimension: rebate {
    type: number
    sql: ${TABLE}.Rebate ;;
  }

  dimension: gst {
    type: number
    sql: ${TABLE}.GST ;;
  }

  dimension: order_total {
    type: number
    sql: ${TABLE}.OrderTotal ;;
  }

  dimension: order_total_inc_gst {
    type: number
    sql: ${TABLE}.OrderTotalincGST ;;
  }

  dimension: courier {
    type: string
    sql: ${TABLE}.Courier ;;
  }

  dimension: tracking_link {
    type: string
    sql: ${TABLE}.TrackingLink ;;
  }

  dimension: tracking_number {
    type: string
    sql: ${TABLE}.TrackingNumber ;;
  }

  dimension: quantity_shipped {
    type: number
    sql: ${TABLE}.QuantityShipped ;;
  }

  dimension: order_reference {
    type: string
    sql: ${TABLE}.OrderReference ;;
  }

  dimension: order_refund_reason {
    type: string
    sql: ${TABLE}.orderRefundReason ;;
  }

  dimension: order_refund_qty {
    type: number
    sql: ${TABLE}.orderRefundQty ;;
  }

  dimension: lineitemid {
    type: string
    sql: ${TABLE}.lineitemid ;;
  }

  dimension: is_market_only {
    type: yesno
    sql: ${TABLE}.IsMarketOnly ;;
  }

  dimension: split_shipping {
    type: yesno
    sql: ${TABLE}.splitShipping ;;
  }

  dimension: potential_split_flag {
    type: yesno
    sql: ${TABLE}.potentialsplitflag ;;
  }

  dimension: quantity_requested {
    type: number
    sql: ${TABLE}.QuantityRequested ;;
  }

  dimension: du_active {
    type: yesno
    sql: ${TABLE}.DUActive ;;
  }

  dimension: is_bulky {
    type: yesno
    sql: ${TABLE}.is_bulky ;;
  }

  dimension: is_bulky_essential {
    type: yesno
    sql: ${TABLE}.is_bulky_essential ;;
  }

  dimension: source_date_time {
    type: date_time
    sql: ${TABLE}.source_date_time;;
  }

  dimension: late_dispatch {
    type: yesno
    sql: ${TABLE}.lateDispatch ;;
  }

  dimension: shipping_status{
    type: string
    sql: ${TABLE}.shippingStatus ;;
  }

  measure:  order_count {
    type:  count_distinct
    sql: ${TABLE}.invoiceid  ;;
  }
}
