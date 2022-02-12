connection: "thelook"

# include all views in the views/ folder in this project
include: "/**/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.



explore: products {
  fields: [-products.esteesunfiltro]
}


explore: users {}

explore: test1{}
explore: filtrofiltro {}
explore: vistaextendida {}
