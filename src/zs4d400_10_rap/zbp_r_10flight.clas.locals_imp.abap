CLASS lhc_zr_10flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Zr10flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Zr10flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
        IMPORTING keys FOR Zr10flight~validateCurrencyCode.
ENDCLASS.

CLASS lhc_zr_10flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD validatePrice.
    DATA reported_record LIKE LINE OF reported-zr10flight.
    DATA failed_record LIKE LINE OF failed-zr10flight.

    READ ENTITIES OF zr_10flight IN LOCAL MODE
      ENTITY Zr10flight
      FIELDS ( price )
      WITH CORRESPONDING #( keys )
      RESULT DATA(flights).


    LOOP AT flights INTO DATA(zr10flight).
      "meldung ausgeben
      IF zr10flight-Price <= 0.
        reported_record-%tky = zr10flight-%tky.
        reported_record-%msg = me->new_message(
                               id   = '/LRN/S4D400'
                               number = '101'
                               severity = if_abap_behv_message=>severity-error ).

        reported_record-%element-price = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-zr10flight.

        " **********************************************************************

        "anderung zurucknehmen
        failed_record-%tky = zr10flight-%tky.
        APPEND failed_record TO failed-zr10flight.


      ENDIF.
    ENDLOOP.

  ENDMETHOD.
  " **********************************************************************
  "ubung 2


  METHOD validateCurrencyCode.

    DATA reported_record LIKE LINE OF reported-zr10flight.
    DATA failed_record LIKE LINE OF failed-zr10flight.
    DATA exists TYPE abap_bool.

    READ ENTITIES OF zr_10flight IN LOCAL MODE
      ENTITY Zr10flight
      FIELDS (  CurrencyCode )
      WITH CORRESPONDING #( keys )
      RESULT DATA(flights).

    LOOP AT flights INTO DATA(zr10flight).

      SELECT SINGLE FROM I_Currency FIELDS @abap_true
      WHERE currency = @zr10flight-CurrencyCode
      INTO @exists.
      IF exists <> abap_false.

        reported_record-%tky = zr10flight-%tky.
        reported_record-%msg = me->new_message(
                               id   = '/LRN/S4D400'
                               number = '102'
                               severity = if_abap_behv_message=>severity-error
                               v1   = zr10flight-currencyCode ).

        reported_record-%element-currencycode = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-zr10flight.



        failed_record-%tky = zr10flight-%tky.
        APPEND failed_record TO failed-zr10flight.

      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
