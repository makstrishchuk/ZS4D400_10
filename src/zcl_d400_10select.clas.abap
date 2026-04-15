CLASS zcl_d400_10select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_10select IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA ls_z00_customers TYPE z00_customers.
    ls_z00_customers-id = '000001'.
    ls_z00_customers-name = 'Mustername-01'.
    ls_z00_customers-plz = '80939'.
    ls_z00_customers-strasse = 'Musterstrasse-01'.
    INSERT INTO z00_customers VALUES @ls_z00_customers.

    ls_z00_customers-id = '000002'.
    ls_z00_customers-name = 'Mustername-02'.
    ls_z00_customers-plz = '80939'.
    ls_z00_customers-strasse = 'Musterstrasse-02'.
    INSERT INTO z00_customers VALUES @ls_z00_customers.
    ls_z00_customers-id = '000003'.
    ls_z00_customers-name = 'Mustername-03'.
    ls_z00_customers-plz = '80939'.
    ls_z00_customers-strasse = 'Musterstrasse-03'.
    INSERT INTO z00_customers VALUES @ls_z00_customers.

    ls_z00_customers-id = '000004'.
    ls_z00_customers-name = 'Mustername-04'.
    ls_z00_customers-plz = '80939'.
    ls_z00_customers-strasse = 'Musterstrasse-04'.
    INSERT INTO z00_customers VALUES @ls_z00_customers.

    ls_z00_customers-id = '000005'.
    ls_z00_customers-name = 'Mustername-05'.
    ls_z00_customers-plz = '80939'.
    ls_z00_customers-strasse = 'Musterstrasse-05'.
    INSERT INTO z00_customers VALUES @ls_z00_customers.
  ENDMETHOD.


ENDCLASS.
