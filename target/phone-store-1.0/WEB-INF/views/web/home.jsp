<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="homeURL" value="/trang-chu"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Trang chủ</title>
</head>
<body>
<br/>
<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<form:form commandName="model" action="#" id="searchForm" method="GET">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter-basic">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Tìm kiếm cơ bản
					</div>
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter-feature">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Tính năng
					</div>
					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Bàn tìm gì
					</div>
				</div>

					<%--Search product--%>
					<div class="dis-none panel-search w-full p-t-10 p-b-15">
						<div class="bor8 dis-flex p-l-15">
							<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" id="btnSearchName">
								<i class="zmdi zmdi-search"></i>
							</button>
							<form:input path="name" cssClass="mtext-107 cl2 size-114 plh2 p-r-15"/>
						</div>
					</div>

					<!-- Filter basic-->
					<div class="dis-none panel-filter-basic w-full p-t-10">
						<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
							<div class="filter-col1 p-r-15 p-b-27">
								<div class="mtext-102 cl2 p-b-15">
									Loại sản phẩm
								</div>
								<ul>
									<c:forEach items="${brands}" var="item">
										<li class="p-b-6">
											<c:url var="url" value="/trang-chu">
												<c:param name="brandCode" value="${item.code}"/>
											</c:url>
											<a href="${url}" class="filter-link stext-106 trans-04">
												${item.name}
											</a>
										</li>
									</c:forEach>
								</ul>
								<form:hidden path="productCategoryCode" id="productCategoryCode"/>
							</div>
							<div class="filter-col1 p-r-15 p-b-27">
								<div class="mtext-102 cl2 p-b-15">
									Mức giá
								</div>
								<ul>
									<li class="p-b-6">
										<a href="<c:url value="/trang-chu?searchByCost=UNDER_2M"/>" class="filter-link stext-106 trans-04">
											Dưới 2 triệu
										</a>
									</li>
									<li class="p-b-6">
										<a href="<c:url value="/trang-chu?searchByCost=2M_4M"/>" class="filter-link stext-106 trans-04">
											Từ 2 - 4 triệu
										</a>
									</li>
									<li class="p-b-6">
										<a href="<c:url value="/trang-chu?searchByCost=4M_7M"/>" class="filter-link stext-106 trans-04">
											Từ 4 - 7 triệu
										</a>
									</li>
									<li class="p-b-6">
										<a href="<c:url value="/trang-chu?searchByCost=7M_13M"/>" class="filter-link stext-106 trans-04">
											Từ 7 - 13 triệu
										</a>
									</li>
								</ul>
								<form:hidden path="searchByCost" id="searchByCost"/>
							</div>
							<div class="filter-col1 p-r-15 p-b-27">
								<div class="mtext-102 cl2 p-b-15">
									Sắp xếp
								</div>
								<ul>
									<li class="p-b-6">
										<a href="<c:url value="/trang-chu?sortBy=DESC"/>" class="filter-link stext-106 trans-04">
											Giá cao đến thấp
										</a>
									</li>
									<li class="p-b-6">
										<a href="<c:url value="/trang-chu?sortBy=ASC"/>" class="filter-link stext-106 trans-04">
											Giá thấp đến cao
										</a>
									</li>
								</ul>
								<form:hidden path="sortBy" id="sortBy"/>
							</div>
						</div>
					</div>

					<!-- Filter feature-->
					<div class="dis-none panel-filter-feature w-full p-t-10">
							<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
								<div class="filter-col1 p-r-15 p-b-27">
									<c:forEach var="item" items="${features}">
										<div class="mtext-102 cl2 p-b-15">
											${item.name}
										</div>
										<ul>
											<form:checkboxes element="li" path="featureSearches"
															 cssClass="filter-link stext-106 trans-04" items="${item.features}"/>
										</ul>
									</c:forEach>
								</div>
								<div class="filter-col1 p-r-15 p-b-27">
									<div class="mtext-102 cl2 p-b-15">
										<button type="button" class="btn btn-primary" id="btnSearchFeature">Tìm kiếm</button>
									</div>
								</div>
							</div>
					</div>
			</div>
			</form:form>
			<div class="row isotope-grid">
				<c:forEach var="item" items="${products}">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<c:set var="imageProduct" value="/repository${item.thumbnail}"/>
								<img src="${imageProduct}" alt="IMG-PRODUCT">
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="<c:url value="/${item.seoUrl}-${item.id}"/>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										${item.name}
									</a>

									<span class="stext-105 cl3">
										Giá gốc: ${item.priceDescription}
									</span>
									<span class="stext-105 cl3">
										Giá khuyến mãi: ${item.priceDiscount} VNĐ
									</span>
									<span class="stext-105 cl3">
										Số lượng: ${item.quantity}
									</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

    });
    $('#btnSearchFeature').click(function (e) {
        e.preventDefault();
        submitSearchForm();
    });
    $('#btnSearchName').click(function (e) {
        e.preventDefault();
        submitSearchForm();
    });
    function submitSearchForm() {
        $('#searchForm').attr('action', '${homeURL}');
        $('#searchForm').submit();
    }
</script>
</body>
</html>