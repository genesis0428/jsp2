<%@page import="board.vo.PageVo"%>
<%@page import="java.time.LocalDate"%>
<%@page import="board.vo.Freeboard"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.dao.freeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	freeBoardDao dao = freeBoardDao.getInstance();
	int pageNo;
// 페이지 번호를 파라미터로 받습니다.
	if(request.getParameter("page")==null) pageNo=1;
	else pageNo = Integer.parseInt(request.getParameter("page"));
	
	int pageSize=10;
//	아래 2줄 명령은 PageVo 객체로 대체합니다.
//	int startNo = (pageNo-1)*pageSize + 1;
	
//	int endNo = startNo+(pageSize-1);
	PageVo pages = new PageVo(pageNo,dao.getCount(),pageSize);


	Map<String,Integer> map = new HashMap<>();
	map.put("startNo",pages.getStartNo());
	map.put("endNo",pages.getEndNo());
	
	List<Freeboard> list = dao.getPageList(map);
	request.setAttribute("list",list);
	request.setAttribute("today",LocalDate.now());
	
	//페이지 번호를 애트리뷰트로 저장			//PageVo 작성하면 아래 pagelist로 대체할수 있습니다.
	request.setAttribute("page", pageNo);
	request.setAttribute("pagelist",pages);
	pageContext.forward("listView.jsp");
%>
<%--
	실행방법 : http://localhost:8082/jsp2/board/listAction.jsp
	실행방법 : http://localhost:8082/jsp2/board/listAction.jsp?page=2
	실행방법 : http://localhost:8082/jsp2/board/listAction.jsp?page=6
	
--%>