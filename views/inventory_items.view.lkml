# The name of this view in Looker is "Inventory Items"
view: inventory_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.inventory_items ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cost" in Explore.

  dimension: cost {
    label: "money"
    type: number
    sql: ${TABLE}.cost ;;
  }
dimension: cs {
  type: number
  sql: ${cost} where ${created_date}=(max(${created_date} ;;
}
  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    drill_fields: [id,cost]
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.id, products.item_name, order_items.count]

  }
  measure: sums {
    type: sum
    sql: ${cost} ;;
    drill_fields: [id, products.id, products.item_name,cost]
  }
  measure: AvgHandleTimeNew {
    label: "Average Handle Time [Working Hours Only]"
    view_label: "Average Durations"
    description: " AVG HandleTime (Max Completedtime- Min AssignedTime-Sum(Parked Duration))"
    type: average_distinct
    sql: ${cost} ;;

#value_format: "0.00"
    html: {% assign seconds=value | modulo: 60 %}
      {{ value | divided_by: 60 | floor }} m &nbsp {{ seconds | divided_by: 1 | floor }} s ;;
  }
}
