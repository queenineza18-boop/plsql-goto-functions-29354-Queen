CREATE OR REPLACE FUNCTION fn_annual_salary (p_emp_id IN NUMBER) 
RETURN NUMBER IS
    v_annual_sal NUMBER(12, 2);
    v_monthly_sal employees.salary%TYPE;
    v_commission employees.commission%TYPE;
BEGIN
    
    SELECT salary, NVL(commission, 0) 
    INTO v_monthly_sal, v_commission
    FROM employees
    WHERE emp_id = p_emp_id;

   
    v_annual_sal := (v_monthly_sal * 12) + v_commission;
    
    RETURN v_annual_sal;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END fn_annual_salary;
/

SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Annual Salary for Employee 101: ' || fn_annual_salary(101));
END;
/
