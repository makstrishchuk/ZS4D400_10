CLASS zcl_10_outpoot DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_outpoot IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS max_count TYPE i VALUE 40.
    DATA numbers TYPE TABLE OF i.
    DATA output TYPE TABLE OF string.

    DO max_count TIMES.


    ENDDO.


  ENDMETHOD.
ENDCLASS.
