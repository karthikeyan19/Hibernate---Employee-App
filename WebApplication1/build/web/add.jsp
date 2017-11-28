<%-- 
    Document   : add
    Created on : 24 Nov, 2017, 2:00:06 PM
    Author     : mca
--%>

<%@page import="emp.Emp"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="org.hibernate.*"
        import="org.hibernate.cfg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Employee</title>
    </head>
    <body>
    <center><h1>Add Employee</h1>
        
        <%!String ename;%>
        <%!int eid;%>
        <%!double salary;%>
        <%
            
           ename = request.getParameter("ename");
           eid =Integer.parseInt(request.getParameter("eid"));
           salary = Double.parseDouble(request.getParameter("esal"));
           
           SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
           
           Session sess =factory.openSession();
           
           Transaction tx = null;
           try{
              
               Emp emp = new Emp();
               emp.setEmpid(eid);
               emp.setEname(ename);
               emp.setEmpsalary(salary);
               tx=sess.beginTransaction();
               sess.save(emp);
               tx.commit();
               out.println("Employee Added Sucessfully");
               
           }catch(Exception e){
             out.println("Error in Insertion");
           }finally{
             sess.close();
             
           }
           
           
           
                  
        
        %>
    
    
    
    
    </center>
    </body>
</html>
