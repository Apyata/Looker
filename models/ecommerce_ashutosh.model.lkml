# Define the database connection to be used for this model.
#webhook
connection: "thelook"
include: "/order_status_counts.dashboard.lookml"

include: "/userss.view.lkml"
# include all the views

include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.


datagroup: ecommerce_ashutosh_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
#access_grant: a {
 # user_attribute:aa
  #allowed_values: ["rush"]
#}
persist_with: ecommerce_ashutosh_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Ecommerce Ashutosh"

explore: inventory_items {
  persist_with: ecommerce_ashutosh_default_datagroup
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    view_label: "sun"
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one

  }



  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  always_filter: {
    filters: [orders.status: "completed"]
  }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}



# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: products {}

explore: users {
  join: userss {
    relationship: many_to_one
    sql_on: ${users.id}.id}=${userss.ids}.id} ;;
    fields: [
      -userss.ids,
      -userss.ages,
      -userss.total_ages
    ]
  }
#required_access_grants: [a]

  }
