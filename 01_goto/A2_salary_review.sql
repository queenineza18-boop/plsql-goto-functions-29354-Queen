DECLARE
    v_salary employees.salary%TYPE;
    v_emp_id employees.emp_id%TYPE := 101; 
BEGIN
    
    SELECT salary INTO v_salary 
    FROM employees 
    WHERE emp_id = v_emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp_id || ' | Current Salary: ' || v_salary);

    IF v_salary >= 1300000 THEN
        GOTO high_salary_tier;
    ELSIF v_salary >= 1000000 THEN
        GOTO mid_salary_tier;
    ELSE
        GOTO low_salary_tier;
    END IF;

    <<high_salary_tier>>
    DBMS_OUTPUT.PUT_LINE('Review Status: Eligible for 15% Senior Bonus.');
    GOTO end_review;

    <<mid_salary_tier>>
    DBMS_OUTPUT.PUT_LINE('Review Status: Eligible for 10% Standard Bonus.');
    GOTO end_review;

    <<low_salary_tier>>
    DBMS_OUTPUT.PUT_LINE('Review Status: Eligible for 5% Base Review Adjustment.');
    GOTO end_review;

    <<end_review>>
    DBMS_OUTPUT.PUT_LINE('Salary review process completed successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee not found.');
END;
/
