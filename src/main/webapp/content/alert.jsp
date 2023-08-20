<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row d-inline-block mb-3">
	<c:if test="${not empty message}">
		<div class="text-bg-info text-uppercase">${message}</div>
	</c:if>
</div>
<div class="row d-inline-block mb-3">
	<c:if test="${not empty error}">
		<div class="text-bg-danger text-uppercase">${error}</div>
	</c:if>
</div>