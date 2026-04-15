CLASS zcl_hello_train DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_train IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lv_name TYPE string VALUE 'Alex'.
    DATA lv_age TYPE i VALUE 15.
    DATA lv_name1 TYPE string VALUE 'Maks'.
    DATA lv_age1 TYPE i VALUE 32.




    out->write( |Name: { lv_name }, { lv_name1 }|  ).
    out->write( |Age: { lv_age }, { lv_age1 }|  ).

    IF lv_age < 18.
      out->write( |{ lv_name } is a child|  ).
    ELSEIF lv_age > 18 AND lv_age < 60.
      out->write( |{ lv_name } is an adult|  ).
    ELSE.
      out->write( |{ lv_name } is a senior|  ).
    ENDIF.
    IF lv_age1 < 18.
      out->write( |{ lv_name1 } is a child|  ).
    ELSEIF lv_age1 > 18 AND lv_age1 < 60.
      out->write( |{ lv_name1 } is an adult|  ).
    ELSE.
      out->write( |{ lv_name1 } is a senior|  ).
    ENDIF.



    DATA lv_city TYPE string VALUE 'paris'.


    CASE lv_city.
      WHEN 'Berlin'.
        out->write( 'Germany' ).
      WHEN 'Paris'.
        out->write( 'France' ).
      WHEN 'Madrid'.
        out->write( 'Spain' ).
      WHEN OTHERS.
        out->write( 'other city' ).
    ENDCASE.


    DATA lv_count TYPE i.
    lv_count = 0.
*      DO 5 TIMES.
*      lv_count = lv_count + 1.
*      out->write( | This is a Loop Number { lv_count } |  ).
*    ENDDO.

    DO 10 TIMES.
    lv_count = lv_count + 1.
    if lv_count = 2 or lv_count = 4 or lv_count = 6 or lv_count = 8 or lv_count = 10 .
      out->write( | This is a Loop Number { lv_count } |  ).

      endif.

    ENDDO.

  ENDMETHOD.
ENDCLASS.
