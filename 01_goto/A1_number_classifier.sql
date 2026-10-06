SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := -5; 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Analyzing number: ' || v_number);

    IF v_number > 0 THEN
        GOTO positive_label;
    ELSIF v_number < 0 THEN
        GOTO negative_label;
    ELSE
        GOTO zero_label;
    END IF;

 
    <<positive_label>>
    DBMS_OUTPUT.PUT_LINE('Result: The number is Positive.');
    GOTO end_program;

  
    <<negative_label>>
    DBMS_OUTPUT.PUT_LINE('Result: The number is Negative.');
    GOTO end_program;

  
    <<zero_label>>
    DBMS_OUTPUT.PUT_LINE('Result: The number is Zero.');
    GOTO end_program;

    <<end_program>>
    DBMS_OUTPUT.PUT_LINE('Program execution finished.');
END;
/
SET SERVEROUTPUT ON;
