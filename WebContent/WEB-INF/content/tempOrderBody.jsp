<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${requestScope.temp_list }" var="temp">
	<tr>
		<td><fmt:formatNumber value="${temp.storage_id }"
				pattern="00000000000" /></td>
		<td><fmt:formatNumber value="${temp.good.id }" pattern="00000000" /></td>
		<td>${temp.good.type }</td>
		<td>${temp.color }</td>
		<td>${temp.size }</td>
		<td><fmt:formatNumber value="${temp.good.price }" pattern=".00" /></td>
		<td><input type="text" value="1.00" class="tdinput"></td>
		<td>${temp.good.price }</td>
		<td><span style="color: transparent;">/</span> <span
			class="glyphicon glyphicon-remove-circle operator" title="删除条目"
			onclick="deleteItem('${temp.id}')"></span></td>
	</tr>
</c:forEach>