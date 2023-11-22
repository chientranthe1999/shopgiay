<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop giày Candy</title>
</head>
<body>
<%@include file="../../common/user/menuuser.jsp"%>
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img style="height: 700px;" src="https://donganshoes.vn/wp-content/uploads/2021/12/banner.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img style="height: 700px;" src="https://censor.vn/wp-content/uploads/2023/05/bannerairjordan1-1400x678.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img style="height: 700px;" src="https://file.hstatic.net/1000230642/collection/3_da9a91027cd0488581c18e767bd6e453.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


    <div class="content">
        <div class="container">
            <ul id="myTab" role="tablist">
                <li class="nav-item tab-li" role="presentation">
                  <button class="active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Sản phẩm trong cửa hàng</button>
                </li>
            </ul>
            <div class="tab-content accordion" id="myTabContent">
                <div class="tab-pane fade show active accordion-item" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                    <div class="row">
                        <div class="col-md-10 list-item row" id="listNewProduct">
                            <c:forEach items="${newwatch}" var="list">
                                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 single-item" >
                                    <a href="detail?id=${list.id}" style="display: block;">
                                        <img class="img-item" src="${list.banner}">
<%--                                        <div class="small-image">--%>
<%--                                            <c:forEach items="${list.imageWatch}" var="img">--%>
<%--                                                <img src="${img.linkImage}">--%>
<%--                                            </c:forEach>--%>
<%--                                        </div>--%>
                                        <div class="content-item-single">
                                            <a href="detail?id=${list.id}"><p class="name-single-item">${list.name}</p></a>
                                            <p style="text-align: center;" class="price-item"><fmt:formatNumber value="${list.price}" maxFractionDigits="3"/>đ</p>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="col-md-12">
                            <div class="paginationss">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination" id="listpage">
                                      <li class="page-item"><a class="page-link" href="home?page=${pre}#myTabContent">Previous</a></li>
                                      <c:forEach items="${totalpage}" var="pages">
                                      <li class="page-item"><a class="page-link" href="home?page=${pages}#myTabContent">${pages}</a></li>
                                      </c:forEach>
                                      <li class="page-item"><a class="page-link" href="home?page=${next}#myTabContent">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
<%@include file="../../common/user/footer.jsp"%>
</body>
</html>