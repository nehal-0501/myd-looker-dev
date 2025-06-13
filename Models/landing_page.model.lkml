connection: "gcp-wow-wmp-ai-data-prod"
include: "/Views/development/landing_page.view.lkml" # Include the new view

explore: Landing_Page {
  label: "landing_page"
  from: landing_page
}
