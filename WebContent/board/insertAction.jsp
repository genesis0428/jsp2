<%@page import="board.vo.Freeboard"%>
<%@page import="board.dao.freeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	//????
	String subject = request.getParameter("subject");			
	String writer = request.getParameter("writer");			
	String password = request.getParameter("password");			
	String content = request.getParameter("content");			
	String ip = request.getRemoteAddr();
	
	freeBoardDao dao = freeBoardDao.getInstance();
//	Freeboard vo = new Freeboard(0,"이광호","1234","테스트5","잘되냐? ok",0,null,null,0);
	Freeboard vo = new Freeboard(0,writer,password,subject,content,0,null,ip,0);
	dao.insert(vo);
	response.sendRedirect("listAction.jsp");	//페이지 수정
%>	