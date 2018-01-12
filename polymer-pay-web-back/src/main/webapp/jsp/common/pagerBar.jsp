<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class=" ">
	<td colspan="8" style="text-align: left; padding-left: 50px;">
		<div class="page-style">
				<select  id="numPerPageBtn">
					<option value="15" <c:if test="${pageBean.numPerPage==15}">selected="selected"</c:if> >15</option>
					<option value="30" <c:if test="${pageBean.numPerPage==30}">selected="selected"</c:if>  >30</option>
					<option value="50" <c:if test="${pageBean.numPerPage==50}">selected="selected"</c:if> >50</option>
					<option value="100" <c:if test="${pageBean.numPerPage==100}">selected="selected"</c:if> >100</option>
				</select>
				<c:if test="${pageBean.currentPage>1}">
					<a href="javascript:goPager(1);" class="width-60"><首页></a>
					<a href="javascript:goPager(${pageBean.currentPage- 1} )" class="width-60"><上一页></a>
				</c:if>
				
				<c:if test="${pageBean.currentPage!=1}">
					<a href='javascript:goPager(1);'>1</a>
				</c:if>
				<c:if test="${pageBean.currentPage>=5}">
					<span>...</span>
				</c:if>
				<c:choose>
					<c:when test="${pageBean.totalPage > pageBean.currentPage+2}"> 
						<c:forEach var="i" begin="${pageBean.currentPage}" end="${pageBean.currentPage+2}">
							<c:if test="${i>0}">
								<c:choose>
									<c:when test="${i==pageBean.currentPage}">
										<a class="cur">&nbsp;${i}&nbsp;</a>
									</c:when>
									<c:otherwise>
										<c:if test="${i!=1 }">
											<a href='javascript:goPager(${i});'>&nbsp;${i}&nbsp;</a>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="${pageBean.currentPage}" end="${pageBean.totalPage}">
							<c:if test="${i>0}">
								<c:choose>
									<c:when test="${i==pageBean.currentPage}">
										<a class="cur">&nbsp;${i}&nbsp;</a>
									</c:when>
									<c:otherwise>
										<c:if test="${i!=1 }">
											<a href='javascript:goPager(${i});'>&nbsp;${i}&nbsp;</a>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<c:if test="${pageBean.currentPage+3>pageBean.totalPage}">
					<span>...</span>
				</c:if>
				<c:if test="${pageBean.currentPage>pageBean.totalPage }">
					<a href="javascript:goPager(${pageBean.totalPage });" >&nbsp;${pageBean.totalPage }&nbsp;</a>
				</c:if>
				<!-- 判断末页 -->
				<c:choose>
					<c:when test="${pageBean.currentPage+1>pageBean.totalPage}">
						<c:if test="${pageBean.totalPage!=1}">
							<span>
								到 <input id="pagetxt" class="pagetxt" name="page" value="1" type="text"> 页 
								<input id="pagebtn" class="pagebtn" value="跳转" maxlength="6" name="gopage" type="submit">
							</span>
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="javascript:goPager(${pageBean.currentPage+1});" class="width-60"><下一页></a>
						<a href="javascript:goPager(${pageBean.totalPage});" class="width-60"><末页></a>
						<span>
							到&nbsp;<input class="pagetxt" id="pagetxt" type="text" name="page" value="${pageBean.currentPage}" />&nbsp;页&nbsp;
							<input id="pagebtn" class="pagebtn" value="跳转" maxlength="6" name="gopage" type="submit">
						</span>
					</c:otherwise>
				</c:choose>
				<!-- 判断末页 -->
				
				<span>
					第${pageBean.currentPage}页/每页${pageBean.numPerPage}条共${pageBean.totalCount} 条
				</span>
		</div>
	</td>
</tr>


