CLASS zcl_10_06loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_06loop IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DO 5 TIMES.
      out->write( sy-index && 'Hello World' ).

    ENDDO.
    DATA lt_itab TYPE TABLE OF i.
    APPEND 100 TO lt_itab.
    APPEND 200 TO lt_itab.
    APPEND 300 TO lt_itab.
    APPEND 400 TO lt_itab.
    APPEND 500 TO lt_itab.
    APPEND 600 TO lt_itab.
    APPEND 700 TO lt_itab.


  ENDMETHOD.
ENDCLASS.
