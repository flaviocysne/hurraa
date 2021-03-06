<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>

    <div class="page-header">
        <h1>
            <small><fmt:message key='title.occurrence' /></small>
        </h1>
    </div>

    <c:if test="${message != null}">
        <div class="alert alert-success">
            <c:out value="${message}" />
        </div>
    </c:if>
    <c:if test='${errors["costCenter"] != null}'>
        <div class="alert alert-danger">
            <strong>${errors["costCenter"][0]}</strong>
        </div>
    </c:if>

    <table class="table table-condensed table-hover table-striped">
        <tr>
            <td><fmt:message key="occurrence.dateOfOpening" /></td>
            <td><fmt:message key="occurrence.problemType" /></td>
            <td><fmt:message key="occurrence.sector" /></td>
            <td><fmt:message key="occurrence.status" /></td>
            <td></td>
        </tr>
        <c:forEach items="${occurrences }" var="occurrence">
            <tr class="selectableOccurrence" data-occurrence-id="${occurrence.id}" >
                <td>
                    <fmt:formatDate value="${occurrence.dateOfOpening}" type="both" />
                </td>
                <td>${occurrence.problemType.name }</td>
                <td>${occurrence.sector.name }</td>
                <td>${occurrence.status }</td>                
                
                <td><a
                    href="${linkTo[ListOccurrenceController].detail(occurrence.id)}"
                    title="<fmt:message key='label.detail' />"> <span
                        class="glyphicon glyphicon-zoom-in"></span>
                </a></td>
            </tr>
        </c:forEach>
    </table>
    
    <script type="text/javascript">
         $().ready(function() {
			$(".selectableOccurrence").unbind().click(function(){
			   var href = $(this).find("td > a").attr('href');
			   window.location.href = href; 
			});
         });
    </script>
</body>
</html>