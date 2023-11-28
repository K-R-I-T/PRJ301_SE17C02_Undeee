<%-- 
    Document   : view
    Created on : Oct 23, 2023, 10:10:10 AM
    Author     : dell
--%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Categories"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.Products"%>
<%@page import="java.util.List"%>

<%
    String name = (String) session.getAttribute("user-loged");
    String report = (String) request.getAttribute("report");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Website của bạn</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <style>
            .brand-name{
                font-family: "Segoe UI", Arial, sans-serif;
                font-size: 30px;

            }

            .navbar-brand img{
                border-radius: 50px;
                width: 50px;
                height: 50px;
            }
            .nav-item{
                margin-right: 50px;
            }
            .nav-link{
                color: white;
                font-weight: 500;
                font-size: 20px;
            }
            #navbarNav{
                margin-left: 120px;
            }


            .card{
                margin-bottom: 60px !important;

            }
            .white{
                color: white;
            }
            .font20{
                font-size: 20px;
            }
            .card img{
                height: 390px;
            }
            .center{
                text-align: center !important;
            }

            .blue{
                color: #006bff
            }
            .footer-bottom{
                background-color: black;
                text-align: center;
                padding: 20px;
                margin-top: 30px;
                color: white;
                font-size: 16px;
                font-weight: 300;
            }
            .footer-main{
                display: flex;
                justify-content: space-between;
                padding : 0;
            }
            .content_2{
                margin-left: 35px;
            }
            .logo-footer>img{
                width: 150px ;
                height: 150px ;
                border-radius: 120px;
            }
            .logo-footer{
                align-items: center;
            }
            @media (min-width: 768px){

                .container{
                    max-width: 1460px !important;
                    padding: 0 !important;
                }
            }
            .order-button{
                background-color: rgb(0, 170, 255);
            }
            .order-button:hover{
                border-color: rgb(0, 170, 255);
                background-color: white;
            }
            .navbar{
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 100000;
                overflow: hidden;
                width: 100% !important;
            }

          
        </style>
    </head>
    <body >

        <!-- Navbar -->
        <nav id="nav" class="navbar navbar-expand-lg white font20" style="background-color: aqua ">
            <a class="navbar-brand" href="./">
                <img src="views/layout/logo.jpg" alt="Logo" width="40" height="40" >
                <p class="brand-name">Úndeee</p>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="home">Trang chủ <i class="ti-home"></i></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="view">Sản phẩm <i class="ti-angle-down"></i> <span class="sr-only">(current)</span></a>
                        <ul class="subnav">
                            <li>
                                <a href="#">Undeee Trà Sữa :)) </a>
                            </li>
                            <li>
                                <a href="#">Undeee Kem Cafe :> </a>
                            </li>
                            <li>
                                <a href="#">Undeee Milk Tea <3 </a>
                            </li>
                        </ul>                   
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Về chúng tôi <i class="ti-angle-down"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Tuyển dụng <i class="ti-angle-down"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Nhượng quyền <i class="ti-angle-down"></i></a>
                    </li>
                </ul>
            </div>
            <form id="searchForm" action="view" method="Post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm" id="searchInput" name="searchKeyword">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="searchButton">Tìm kiếm</button>
                    </div>
                </div>
            </form>

        </nav>
        <div> <img style="width: 100%" id="clubs" class="clubs" src="views/layout/Dong-gia-25k-slide-banner.png" alt=""></div>
        <!-- Danh sách sản phẩm dạng card -->
        <div class="container mt-6">


            <div class="center blue">  <h1 >Undeee menu</h1></div>
            <div  class="center"> <h2>Best Seller</h2></div>
            <div class="search   ti-mouse"> </div>



            <div class="row">
                <%
                    List<Products> productList = (List<Products>) request.getAttribute("list");

                    for (int i = 0; i < productList.size(); i++) {
                        Products product = productList.get(i);
                %>
                <div class="col-md-3">
                    <div class="card">

                        <img src="views/Drinks/<%= product.getImage()%>" class="card-img-top" alt="Sản phẩm 1" style="width: 100%; height: 250px">
                        <div class="card-body" style="align-items: center !important">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p class="card-text"><%= product.getPrice()%> $</p>
                        </div>
                        <div class="card-footer">

                            <button class="order-button" "><a href="AddToCartController?id=<%= product.getId()%>" class="btn" role="button">Order Now</a></button>

                        </div>
                    </div>
                </div>
                <%
                    }
                %>         
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
        <%@include file="layout/footer.jsp" %>
    </body>

</html>

<script>
    function xoaSanPham(productId) {
        if (confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "delete?id=" + productId, true);
            xhr.send();

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    location.reload();
                }
            };
        }
    }



    document.getElementById("searchButton").addEventListener("click", function () {
        var searchKeyword = document.getElementById("searchInput").value;
        var form = document.getElementById("searchForm");
        form.action = "home?searchKeyword=" + searchKeyword;
        form.submit();
    });

</script>


<--<!-- Search Category -->
<script>
    document.getElementById('loaiSanPham').addEventListener('change', function () {
        const categoryId = document.getElementById('loaiSanPham').value;
        const searchForm = document.getElementById('searchForm');

        // Update the search form action URL to include the selected category ID
        searchForm.action = "view?searchCategory=" + categoryId;

        // Submit the search form to trigger the servlet processing
        searchForm.submit();
    });

</script>


<--<!-- Search Status -->
<script>
    document.getElementById('status').addEventListener('change', function () {
        const status = document.getElementById('status').value;
        const searchForm = document.getElementById('searchForm');

        // Update the search form action URL to include the selected category ID
        searchForm.action = "view?searchKeyword=" + status;

        // Submit the search form to trigger the servlet processing
        searchForm.submit();
    });

</script>

<script>
    const imageElement = document.getElementById("clubs");
    const imageSources = ["views/layout/Dong-gia-25k-slide-banner.png"
                , "views/layout/Series-ly-1-lit-slide-banner.png",
        "views/layout/Slide_banner-1.jpg"]; // Danh sách các đường dẫn ảnh

    let currentImageIndex = 0;

    function changeImage() {
        imageElement.src = imageSources[currentImageIndex];
        currentImageIndex = (currentImageIndex + 1) % imageSources.length;
    }

    setInterval(changeImage, 3000); // Thực hiện hàm changeImage sau mỗi 3000ms (3 giây)
</script>









