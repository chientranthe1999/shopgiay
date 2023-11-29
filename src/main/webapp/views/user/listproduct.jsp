<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm Kiếm Sản phẩm</title>
</head>
<body>
<%@include file="../../common/user/menuuser.jsp"%>
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-3 col-lg-3">
                <form class="filter form-check">
                    <label class="lb-chon-danhmuc">Chọn khoảng giá
                        <button onclick="searchFull(0)" class="btn-apdung">Áp dụng</button>
                    </label>
                    <label class="radio-custom">Mọi khoảng giá
                        <input value="0-1000000000" type="radio" name="khoangia" checked="checked">
                        <span class="checkmark"></span>
                    </label>
                    <label class="radio-custom">Dưới 500,000đ
                        <input value="0-499000" type="radio" name="khoangia">
                        <span class="checkmark"></span>
                    </label>
                    <label class="radio-custom">500,000₫ - 1,000,000₫
                        <input value="500000-1000000" type="radio" name="khoangia">
                        <span class="checkmark"></span>
                    </label>
                    <label class="radio-custom">1,000,000₫ - 1,500,000₫
                        <input value="1000000-1500000" type="radio" name="khoangia">
                        <span class="checkmark"></span>
                    </label>
                    <label class="radio-custom">1,500,000₫ - 2,000,000₫
                        <input value="1500000-2000000" type="radio" name="khoangia">
                        <span class="checkmark"></span>
                    </label>
                    <label class="radio-custom">Trên 2,000,000₫
                        <input value="2000000-1000000000" type="radio" name="khoangia" >
                        <span class="checkmark"></span>
                    </label>
                    <hr>
                    <label class="lb-chon-danhmuc">Chọn danh mục</label>
                    <div id="listsearchCategory">
                        <label class="radio-custom">Tất cả danh mục
	                        <input value="-1" type="radio" name="danhmuc" checked="checked">
	                        <span class="checkmark"></span>
                    	</label>
	                 </div>
                    <c:forEach items="${listcategory}" var="list">
	                    <div id="listsearchCategory">
	                        <label class="radio-custom">${list.name}
		                        <input value="${list.id}" type="radio" name="danhmuc">
		                        <span class="checkmark"></span>
	                    	</label>
	                    </div>
                    </c:forEach>
                    <hr>
                    <label class="lb-chon-danhmuc">Chọn thương hiệu</label>
                     <div id="listsearchCategory">
                        <label class="radio-custom">Tất cả thương hiệu
	                        <input value="-1" type="radio" name="thuonghieu" checked="checked">
	                        <span class="checkmark"></span>
                    	</label>
	                 </div>
                    <c:forEach items="${listtrademark}" var="list">
                        <div id="listsearchCategory">
                            <label class="radio-custom">${list.name}
                                <input value="${list.id}" type="radio" name="thuonghieu">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </c:forEach>
                </form>
            </div>
            <div class="col-sm-12 col-md-9 col-lg-9">
                <c:if test="$(listproduct.length == 0)">
                    No result
                </c:if>

                <div class="row">
                    <div class="col-md-10 list-item row" id="listNewProduct">
                        <c:forEach items="${listproduct}" var="list">
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 single-item" >
                                <a href="detail?id=${list.id}"><img class="img-item" src="${list.banner}"></a>
                                <div class="small-image">
                                <c:forEach items="${list.imageWatch}" var="img">
                                    <img src="${img.linkImage}">
                                </c:forEach>
                                </div>
                                <div class="content-item-single">
                                    <a href="detail?id=${list.id}"><p class="name-single-item">${list.name}</p></a>
                                    <p style="text-align: center;" class="price-item"><fmt:formatNumber value="${list.price}" maxFractionDigits="3"/>đ</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="paginationss">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" id="listpage">
                            <c:forEach items="${totalpage}" var="pages">
                              <li onclick="appendurl(${pages})" class="page-item"><a class="page-link">${pages}</a></li>
                            </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function appendurl(page) {
	var url =  window.location.href;
	if(url.split('khoangia').length > 1){
		url = url.split('&page')[0]
		url = url+'&page='+page
		window.location.replace(url)
	}
	else if(url.split('cate').length > 1){
		url = url.split('&page')[0]
		url = url+'&page='+page
		window.location.replace(url)
	}
	else if(url.split('search').length > 1){
		url = url.split('&page')[0]
		url = url+'&page='+page
		window.location.replace(url)
	}
	else{
		 window.location.replace('product?page='+page)
	}
}
</script>
<%@include file="../../common/user/footer.jsp"%>
</body>
</html>
<script>
    window.onload = function() {
        "use strict"
        const url = new URL(window.location.href);
        const priceRange = url.searchParams.get("khoangia");
        const category = url.searchParams.get("danhmuc")
        const origin = url.searchParams.get("thuonghieu")
        if(priceRange){
            const selector = "input[value='" + priceRange + "']";
            document.querySelector(selector).checked = true;
        }

        if(category) {
            const selector = "input[value='" + category + "'][name='danhmuc']";
            document.querySelector(selector).checked = true;
        }

        if(origin) {
            const selector = "input[value='" + origin + "'][name='thuonghieu']";
            document.querySelector(selector).checked = true;
        }
    }
</script>
