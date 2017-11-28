<%-- 
    Document   : list
    Created on : 24 Nov, 2017, 1:59:42 PM
    Author     : mca
--%>

<%@page import="org.hibernate.HibernateException"%>
<%@page import="java.util.Iterator"%>
<%@page import="emp.Emp"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Employee</title>
    </head>
    <body>
    <center><h1>List Employee Details</h1>
       
        <table border="1">
            <tr>
                <td>Emp Id</td>
                <td>Emp Name</td>
                <td>Salary</td>
                
            </tr>
            <%!Emp employee;%>
        <%
            
         
           SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
           
           Session sess =factory.openSession();
         Transaction tx = null;
      
      try {
         tx = sess.beginTransaction();
         List<Emp> employees = sess.createQuery("FROM Emp").list(); 
         for (Iterator iterator = employees.iterator(); iterator.hasNext();){
            Emp employee = (Emp) iterator.next(); 
            %>
            <tr>
                
                <td><%=employee.getEmpid()%></td>
                        
                 <td><%=employee.getEname()%></td>
                 
                  <td><%=employee.getEmpsalary()%></td>
                
            </tr>
            
        <% }
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         sess.close(); 
      }
          
        
        
        %>
    
    
    </center>
    </body>
</html>
