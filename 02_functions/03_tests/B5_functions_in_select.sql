SET SERVEROUTPUT ON;

DECLARE
    v_emp_id          employees.emp_id%TYPE := 101;
    v_emp_name        VARCHAR2(100);
    v_hire_date       employees.hire_date%TYPE;
    v_annual_sal      NUMBER(12, 2);
    v_years           NUMBER(5, 2);
    v_tax             NUMBER(12, 2);
BEGIN
    
    SELECT first_name || ' ' || last_name, hire_date
    INTO v_emp_name, v_hire_date
    FROM employees
    WHERE emp_id = v_emp_id;

   
    v_annual_sal := fn_annual_salary(v_emp_id);
    v_years := fn_years_of_service(v_hire_date);
    v_tax := fn_calculate_tax(v_annual_sal);

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('       EMPLOYEE ANALYTICS REPORT        ');
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || v_emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || v_emp_name);
    DBMS_OUTPUT.PUT_LINE('Hire Date     : ' || TO_CHAR(v_hire_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Years of Serv : ' || v_years || ' years');
    DBMS_OUTPUT.PUT_LINE('Annual Salary : $' || TO_CHAR(v_annual_sal, 'FM999,999,999.00'));
    DBMS_OUTPUT.PUT_LINE('Estimated Tax : $' || TO_CHAR(v_tax, 'FM999,999,999.00'));
    DBMS_OUTPUT.PUT_LINE('========================================');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee with ID ' || v_emp_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
