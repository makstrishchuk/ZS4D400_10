CLASS zcl_d400_00_09glob_classe DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_09glob_classe IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lo_house TYPE REF TO lcl_house.
    DATA lt_collection TYPE TABLE OF REF TO lcl_house.

    CREATE OBJECT lo_house.
    lo_house->set_data(
      iv_id    = 100
      iv_color = 'Blau' ).
    APPEND lo_house TO lt_collection.

    CREATE OBJECT lo_house.
    lo_house->set_data(
      iv_id    = 101
      iv_color = 'Rot' ).
    APPEND lo_house TO lt_collection.
    CREATE OBJECT lo_house.
    lo_house->set_data(
      iv_id    = 102
      iv_color = 'Gelb' ).
    APPEND lo_house TO lt_collection.

    CREATE OBJECT lo_house.
    lo_house->set_data(
      iv_id    = 103
      iv_color = 'Gelb' ).
    APPEND lo_house TO lt_collection.


    LOOP AT lt_collection INTO lo_house." WHERE table_line->mv_color = 'Gelb'.
      lo_house->get_data(
        IMPORTING
          ev_id    =  DATA(lv_id)
          ev_color =  DATA(lv_color)
      ).


      out->write( CONV string( lv_id )    && `  `  && lv_color  ).

      out->write( lo_house->compute( iv_number1 = 100 iv_number2 = 200 ) ).
    ENDLOOP.
    lcl_house=>gv_house_counter = 345.
    out->write( `Anzahl der Häuser: `  && CONV string( lcl_house=>gv_house_counter ) ).





  ENDMETHOD.
ENDCLASS.
