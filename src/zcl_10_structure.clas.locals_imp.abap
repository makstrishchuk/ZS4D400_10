*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.

    TYPES BEGIN OF st_details.
    TYPES DepartureAirport TYPE /dmo/airport_from_id.
    TYPES DestinationAirport TYPE /dmo/airport_to_id.
    TYPES AirlineName TYPE /dmo/carrier_name.
    TYPES END OF st_DETAILS.


    CLASS-DATA conn_counter TYPE i.

    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

    METHODS constructor IMPORTING i_carrier_id    TYPE /dmo/carrier_id
                                  i_connection_id TYPE /dmo/connection_id
                        RAISING   cx_abap_invalid_value.


  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.
    DATA carrier_name TYPE /dmo/carrier_name.
    data details type st_details.


ENDCLASS.



CLASS lcl_connection IMPLEMENTATION.

  METHOD get_output.

    APPEND |------------------------------| TO r_output.
    APPEND |Carrier:     { carrier_id  } { details-airlinename }| TO r_output.
    APPEND |Connection:  { connection_id }| TO r_output.
    APPEND |Airport from:  { details-departureairport }| TO r_output.
    APPEND |Airport to:  { details-destinationairport }| TO r_output.

  ENDMETHOD.

  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.




    SELECT SINGLE FROM /dmo/i_connection
    FIELDS departureairport, destinationairport, \_airline-name as airlineName
    WHERE airlineid = @i_carrier_id
    AND connectionid = @i_connection_id
    INTO  @details.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.



*
*    select single from /dmo/connection
*    fields airport_from_id, airport_to_id
*    where carrier_id = @i_carrier_id
*    and connection_id = @i_connection_id
*    into ( @airport_from_id, @airport_from_id ).
*    if sy-subrc <> 0.
*    raise exception type cx_abap_invalid_value.
*    endif.


    carrier_id    = i_carrier_id.
    connection_id = i_connection_id.
    conn_counter += 1.
  ENDMETHOD.

ENDCLASS.
