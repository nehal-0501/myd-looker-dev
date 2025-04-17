connection: "gcp-wow-wmp-ai-data-dev"
include: "/Views/development/digital_sessions_products.view.lkml"
include: "/Views/development/digital_sessions.view.lkml"

explore: digital_sessions_products {
  from: digital_sessions_products

  join: digital_sessions {
    type: left_outer
    sql_on: ${digital_sessions_products.session_id} = ${digital_sessions.session_id} ;;
    relationship: many_to_one
  }
}
