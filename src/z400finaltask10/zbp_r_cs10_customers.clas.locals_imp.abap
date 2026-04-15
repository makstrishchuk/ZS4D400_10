CLASS LHC_ZR_CS10_CUSTOMERS DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrCs10Customers
        RESULT result,
      determinecity FOR DETERMINE ON SAVE
            IMPORTING keys FOR ZrCs10Customers~determinecity.
ENDCLASS.

CLASS LHC_ZR_CS10_CUSTOMERS IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD determinecity.

  READ ENTITIES OF zr_cs10_customers IN LOCAL MODE
  ENTITY ZrCs10Customers
  FIELDS ( postcode country city )
  WITH CORRESPONDING #( keys )
  RESULT DATA(lt_customers).

DATA lt_update TYPE TABLE FOR UPDATE zr_cs10_customers.

LOOP AT lt_customers INTO DATA(ls_customer).

  IF ls_customer-postcode IS NOT INITIAL
     AND ls_customer-country IS NOT INITIAL.

    SELECT SINGLE city
      FROM zcs10_postcity
        where country  = @ls_customer-country
        AND postcode = @ls_customer-postcode
      INTO @DATA(lv_city).

    IF sy-subrc = 0.
      APPEND VALUE #(
        %tky = ls_customer-%tky
        city = lv_city
      ) TO lt_update.
    ENDIF.

  ENDIF.

ENDLOOP.

IF lt_update IS NOT INITIAL.
  MODIFY ENTITIES OF zr_cs10_customers IN LOCAL MODE
    ENTITY ZrCs10Customers
    UPDATE FIELDS ( city )
    WITH lt_update.
ENDIF.

  ENDMETHOD.

ENDCLASS.
