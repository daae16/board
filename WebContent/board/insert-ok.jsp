<%@page import="java.sql.*"%>
<%@page import="common.Connector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String title = request.getParameter("title");
String content = request.getParameter("content");
String creusr = request.getParameter("creusr");

String sql = "INSERT INTO board\r\n" + 
      "(title, content, credat, cretim, creusr)\r\n" + 
      "VALUES(\r\n" + 
      "?,\r\n" + 
      "?,\r\n" + 
      "DATE_FORMAT(NOW(), '%Y%m%d'),\r\n" + 
      "DATE_FORMAT(NOW(), '%H%i%s'),\r\n" + 
      "?\r\n" + 
      ")";
Connection con = null;
try{
con = Connector.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, title);
ps.setString(2, content);
ps.setString(3, creusr);

int result = ps.executeUpdate();
   if(result==1){
      out.println("잘 들어 갔음~");
   }
}catch(SQLException e){
   out.println("에러났음: "+ e.getMessage());
}finally{
   Connector.close();
}
%>