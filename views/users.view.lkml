# The name of this view in Looker is "Users"
view: users {
 # required_access_grants: [a]
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.users ;;
  drill_fields: [id]
   # primary key is the unique key for this table in the underlying database.
   #You need to define a primary key in a view in order to join to other views.

  dimension: id {

    primary_key: yes
    label: "new_id"
    type: number
    sql: ${TABLE}.id-1 ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {

    type: number
    sql: ${TABLE}.age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {

    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
      hour,
      quarter,

      year
    ]
    convert_tz: yes
    sql: ${TABLE}.created_at ;;


  }
  dimension_group: talktime {
  type: duration
  intervals: [minute]
  sql_start: ${created_time} ;;
  sql_end: CURRENT_TIMESTAMP() ;;
  }
  dimension: cod_date {
    type: date
    sql: DATE(year, month, day};;
  }
  dimension: raw_effective_utc_date {
    type: date_time
    sql: ${created_raw} ;;
    convert_tz: yes
  }

  parameter: date_granularity {
    type: string
    allowed_value: { value: "day" }
    allowed_value: { value: "hour" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }
    dimension: date {
      type: string
      #label_from_parameter: date_granularity
      label: "
    {% if date_granularity._parameter_value == \"'hour'\" %} (Dynamic) Start Hour of Day
    {% elsif date_granularity._parameter_value == \"day\" %} (Dynamic) Start Day of Week
    {% elsif date_granularity._parameter_value == \"year\" %} (Dynamic) Start Week of Year
    {% elsif date_granularity._parameter_value == \"quarter\" %} (Dynamic) Start Quarter of Year
    {% else %} (Dynamic) Start Dimension (Finite) {% endif %}"
      sql:

          {% if date_granularity._parameter_value == 'hour' %}
            ${created_hour}
          {% else %}
            ${created_date}
          {% endif %};;
    }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    drill_fields: [id]


  }

  dimension: gen {
    type: string
    sql: ${TABLE}.gen ;;

  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name  ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  dimension: full_name {
    type: string
    sql: ${first_name}||' '||${last_name};;
  }



  dimension: length {
    type: number
    sql: len(${first_name}) ;;
    value_format_name: id
    html:
     {% if value == lengt._value %}
        <p style = "background-color:green;font-size:100%">{{rendered_value }}</p>
        {% else  %}
        <p style="background-color:Tomato;font-size:100%">{{rendered_value }}</p>
        {% endif %} ;;

    }

    dimension: lengt {
      type: number
      sql: len(${last_name}) ;;
      html:
      {% if value == length._value %}
          <p style = "background-color:green;font-size:100%">{{rendered_value }}</p>
          {% else  %}
          <p style="background-color:Tomato;font-size:100%">{{rendered_value }}</p>
          {% endif %} ;;

      }
#dimension: difference {
#  type: number
 # sql: ${lengt}-@{ss} ;;
#}
  #measure: dash_nav {
   # hidden: no
  #  label: "Navigation Bar"
   # type: string
   # sql: "";;
   # html:
   # <div style="background-color: #FFFFFF; height:525px;width:100%"></div>
    #  <div style="background-color: #FFFFFF; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
    #    <nav style="font-size: 18px; color: #4285F4">
     #     <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="https://dcl.dev.look.looker.com
#/dashboards/2234?State={{ _filters['users.state'] | url_encode }}&Status={{ _filters['orders.status'] | url_encode }}">Order Fulfillment</a>

    #    </nav>
#      </div>
 #   <div style="background-color: #FFFFFF; height:500px;width:100%"></div>;;
 # }

dimension: age_tier {
  type: tier
  tiers: [1,10,20,30,40,50,60,70,80,90,99]
  sql: ${age} ;;
  style: integer
  value_format: "$#,##0"
}
  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, orders.count]
  }
  measure: averageage {
    type: average
    sql: ${age} ;;
  }
  measure: xx {
    type: number
    sql: ${lengt}/${length};;
  }

  filter: factory_filter {
    type: string
  }
  #dimension: reusing {
   # type: date
  #  sql: @{ss} ;;
#  }

}
