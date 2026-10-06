v_annual_sal := fn_annual_salary(v_emp_id);
    v_years := fn_years_of_service(v_hire_date);
    v_tax := fn_calculate_tax(v_annual_sal);
