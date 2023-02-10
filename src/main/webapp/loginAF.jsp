<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	MemberDao dao = MemberDao.getInstance();
	
	MemberDto mem = dao.login(id, pwd);
	
	if(mem != null){
			//로그인 회원정보//session에서 정보를 얻어옴/세션에서 정보얻어오는방법
			//request.getSession().setAttribute(name, value);
			session.setAttribute("login", mem);
			//session.setMaxInactiveInetrval(60 * 60 * 2); //로그인 정보 시간 2시간 설정//요즘에는 쓸모없음
		%>		 
		<script type="text/javascript">
		alert("환영합니다. <%=mem.getId() %>님");
		//location.href = "";
		</script>
		<%
	}else{
		%>		 
		<script type="text/javascript">
		alert("아이디나 패스워드를 확인 하십시오");
		location.href = "login.jsp";
		</script>
		<%
	}
	%>
	
	
	
	