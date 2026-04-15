CLASS zcl_10_fill_postcity DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_fill_postcity IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.


  DATA lt_postcity TYPE TABLE OF zcs10_postcity.

  DELETE FROM zcs10_postcity.

  lt_postcity = VALUE #(
    ( client = sy-mandt country = 'DE' postcode = '94469' city = 'DEGGENDORF' )
    ( client = sy-mandt country = 'DE' postcode = '80331' city = 'MUNCHEN'   )
    ( client = sy-mandt country = 'DE' postcode = '10115' city = 'BERLIN'     )
  ).

  INSERT zcs10_postcity FROM TABLE @lt_postcity.

  out->write( 'Testdaten wurden ok.' ).

  ENDMETHOD.
ENDCLASS.
