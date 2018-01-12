<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<!---->
		<div class="dataTables_wrapper">
		<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">
			第&nbsp;${pageBean.currentPage}/${pageBean.numPerPage}&nbsp;页&nbsp;&nbsp;&nbsp;共&nbsp;${pageBean.totalCount}&nbsp;条&nbsp;&nbsp;
			显示
			<select  style="border:1px solid #ddd;box-sizing:border-box;cursor: pointer;font-weight:normal;line-height:normal;white-space:nowrap; width:40px;"  id="numPerPageBtn">
					<option value="15" <c:if test="${pageBean.numPerPage==15}">selected="selected"</c:if> >15</option>
					<option value="30" <c:if test="${pageBean.numPerPage==30}">selected="selected"</c:if>  >30</option>
					<option value="50" <c:if test="${pageBean.numPerPage==50}">selected="selected"</c:if> >50</option>
					<option value="100" <c:if test="${pageBean.numPerPage==100}">selected="selected"</c:if> >100</option>
				</select>
			条
		</div>
			
		<div class="dataTables_paginate paging_full_numbers" id="DataTables_Table_0_paginate">
				<!--  当首次加载显示全部但是无事件 -->
				<c:if test="${pageBean.currentPage==1}" >
					<a href="javascript:void(0)" class="paginate_button first disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="DataTables_Table_0_first">第一页</a>
					<a  href="javascript:void(0)" class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" id="DataTables_Table_0_previous">上一页</a>
				</c:if>
				
				<c:if test="${pageBean.currentPage>1}" >
					<a href="javascript:goPager(1);" class="paginate_button first disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="DataTables_Table_0_first">第一页</a>
					<a  href="javascript:goPager(${pageBean.currentPage- 1} )" class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" id="DataTables_Table_0_previous">上一页</a>
				</c:if>
				
				<c:if test="${pageBean.currentPage!=1}">
					<span>
					<a  href='javascript:goPager(1);' class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">1</a>
					</span>
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
										<span>
											<a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a>
<%-- 											<a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a> --%>
										</span>
										
									</c:when>
									<c:otherwise>
										<c:if test="${i!=1 }">
											<a href='javascript:goPager(${i});' class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a>
<%-- 											<a href='javascript:goPager(${i});' class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a> --%>
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
										<span>
											<a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a>
<%-- 											<a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a> --%>
										</span>
									</c:when>
									<c:otherwise>
										<c:if test="${i!=1 }">
											<a href='javascript:goPager(${i});' class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a>
<%-- 											<a href='javascript:goPager(${i});' class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${i}</a> --%>
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
					<%-- <a href="javascript:goPager(${pageBean.totalPage });" >&nbsp;${pageBean.totalPage }&nbsp;</a> --%>
					<span>
							<a href="javascript:goPager(${pageBean.totalPage });" class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${pageBean.totalPage }</a>
<%-- 							<a href="javascript:goPager(${pageBean.totalPage });" class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${pageBean.totalPage }</a> --%>
					</span>
				</c:if>
				<!-- 判断末页 -->
				<c:choose>
					<c:when test="${pageBean.currentPage+1>pageBean.totalPage}">
						<c:if test="${pageBean.totalPage!=1}">
							<span>
								到 <input id="pagetxt" class="input-text" style="width:40px;height:27px; margin: 0 0 6px 6px;" name="page" value="${pageBean.currentPage}" type="text"> 页 
								<input id="pagebtn" class="paginate_button next disabled" value="跳转" maxlength="6" name="gopage" type="submit">
							</span>
						</c:if>
						<!-- 默认第一页也显示下尾页 -->
						<c:if test="${pageBean.currentPage==1}" >
							<a href="javascript:void(0)；" class="paginate_button next disabled" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" id="DataTables_Table_0_next">下一页</a>
							<a href="javascript:void(0);" class="paginate_button last disabled" aria-controls="DataTables_Table_0" data-dt-idx="4" tabindex="0" id="DataTables_Table_0_last">最后一页</a>
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="javascript:goPager(${pageBean.currentPage+1});" class="paginate_button next disabled" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" id="DataTables_Table_0_next">下一页</a>
						<a href="javascript:goPager(${pageBean.totalPage});" class="paginate_button last disabled" aria-controls="DataTables_Table_0" data-dt-idx="4" tabindex="0" id="DataTables_Table_0_last">最后一页</a>
							到&nbsp;<input class="input-text" style="width:40px;height:27px; margin: 0 0 6px 6px;" id="pagetxt" type="text" name="page" value="${pageBean.currentPage}" />&nbsp;页&nbsp;
							<input id="pagebtn" class="paginate_button next disabled" value="跳转" maxlength="6" name="gopage" type="submit">
					</c:otherwise>
				</c:choose>
				
				<!-- 判断末页 -->
		<!-- 
				<a class="paginate_button first disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="DataTables_Table_0_first">第一页</a>
				<a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" id="DataTables_Table_0_previous">上一页</a>
				<span>
					<a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">1</a>
				</span>
				<a class="paginate_button next disabled" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" id="DataTables_Table_0_next">下一页</a>
				<a class="paginate_button last disabled" aria-controls="DataTables_Table_0" data-dt-idx="4" tabindex="0" id="DataTables_Table_0_last">最后一页</a> -->
		</div>
		</div>
		<!---->

