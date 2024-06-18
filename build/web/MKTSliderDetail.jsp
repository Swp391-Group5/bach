<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Dashboard for managing sliders" />
        <meta name="author" content="Veetu" />
        <title>Dashboard - Slider Management</title>

        <!-- Latest Bootstrap CSS and JS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Font Awesome -->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

        <!-- Custom CSS -->
        <style>
            body {
                background-color: #e0f7fa; /* Soft blue background */
            }
            .container {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .text-center {
                margin-bottom: 20px;
            }
            .btn-outline-dark {
                border-color: #0275d8;
                color: #0275d8;
            }
            .btn-outline-dark:hover {
                background-color: #0275d8;
                color: #fff;
            }
            .btn-dark {
                background-color: #0275d8;
                border-color: #0275d8;
            }
            .btn-dark:hover {
                background-color: #025aa5;
                border-color: #025aa5;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container rounded bg-white mt-5 mb-5">
                        <form action="update-slider" method="get">
                            <div class="row" style="margin-top: 8%;">
                                <div class="p-4">
                                    <h4 class="text-center">Chỉnh sửa Slider</h4>
                                </div>

                                <div class="col-md-8">
                                    <div class="p-3 py-5">
                                        <div class="col-md-12">
                                            <input type="hidden" class="form-control" name="slider_id" value="${Slider_Detail.sliderId}">
                                        </div>
                                        <div class="col-md-12">
                                            <label for="slider_title" class="form-label">Tiêu đề</label>
                                            <input type="text" id="slider_title" class="form-control" name="slider_title" value="${Slider_Detail.sliderTitle}">
                                        </div>
                                        <div class="col-md-12">
                                            <label for="backlink" class="form-label">link URL</label>
                                            <textarea class="form-control" id="backlink" name="backlink" rows="2">${Slider_Detail.backlink}</textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <label for="slider_image" class="form-label">Hình thu nhỏ</label>
                                            <input type="text" id="slider_image" name="slider_image" class="form-control" value="${Slider_Detail.sliderImage}">
                                        </div>
                                        <img class="mt-5 img-fluid" src="${Slider_Detail.sliderImage}" alt="Slider Image" />
                                    </div>
                                </div>

                                <div class="mt-5 p-4 text-center">
                                    <a href="slider-list" class="btn btn-outline-dark">Quay lại</a>
                                    <button type="submit" class="btn btn-dark">Lưu</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </main>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
