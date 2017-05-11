<%@page import="com.db.support.Page"%>
<%@page import="microservice.api.PageData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Page pages = (Page)request.getAttribute("pages");
%>
<div class="modal-footer no-margin-top">
	<ul class="pagination pull-right no-margin">
		<li class="prev disabled"><a href="#"> <i
				class="icon-double-angle-left"></i>
		</a></li>
		<%if(pages.getPageSize() > 11 && pages.getPageSize() - pages.getPageNumber() > 11) { 
			for(int i = pages.getPageNumber()/8*8+1; i < 11 * (pages.getPageNumber()/8+1); i++) {
				if((i - (pages.getPageNumber()/8+1)) < 9 * (pages.getPageNumber()/8+1)) {%>
				<%if(pages.getPageNumber() == i) {%>
				<li class="active"><a href="#"><%=i%></a></li>
				<%} else { %> 
				<li><a href="#"><%=i%></a></li>
				<%}} else {%>
					<li><a href="#">...</a></li>
					<li><a href="#"><%=pages.getPageSize() %></a></li>
				<%} %>
			<%} %>
		<%} else {%>
			
		<%} %>
		<li class="next"><a href="#"> <i
				class="icon-double-angle-right"></i>
		</a></li>
	</ul>
</div>