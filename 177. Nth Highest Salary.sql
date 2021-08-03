CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  
  SET N = N-1;
  RETURN (
      
     select distinct salary from employee order by salary desc 
     limit 1 offset N
  );
END


or 





      with result as 
      (
      
         select salary,dense_rank() over (order by salary desc) as denserank
         from employee
         
      
      
      )
      
      select salary from result 
      where denserank=N	
