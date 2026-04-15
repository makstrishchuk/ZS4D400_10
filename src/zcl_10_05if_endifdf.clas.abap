CLASS zcl_10_05if_endifdf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_05if_endifdf IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lv_demo_01 TYPE i.
    lv_demo_01 = 600.
    IF lv_demo_01 > 900.
      out->write( 'lv_demo_01 > 900' ).
    ELSEIF lv_demo_01 > 500.
      out->write( 'lv_demo_01 > 500' ).
    ELSE.
      out->write( 'lv_demo_01' ).
    ENDIF.





  ENDMETHOD.
ENDCLASS.
