    <%-- 
    Document   : universityswiper
    Created on : Jun 25, 2025, 9:53:17 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>University Swiper</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
       <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.css">
    </head>
    <body>
        <div class="swiper-container-wrapper flex gap-10">
            
              
        
   <div class="swiper-container-wrapper flex flex-col items-center text-center">
    <!-- Tiêu đề và các nút -->
    <div class="mb-10">
        <p class="text-[#800000] uppercase font-semibold tracking-widest text-sm">
            Trường Đại Học
        </p>
        <h2 class="text-4xl md:text-5xl font-extrabold text-gray-900 mt-2">
            Việt Nam
        </h2>

        <!-- Tabs -->
        <div class="mt-6 flex justify-center flex-wrap gap-4">
            <button class="border border-[#800000] text-[#800000] px-5 py-2 rounded-lg font-semibold">
                Miền Bắc
            </button>
            <button class="border border-[#800000] text-[#800000] px-5 py-2 rounded-lg font-semibold">
                Miền Trung
            </button>
            <button class="border border-[#800000] text-[#800000] px-5 py-2 rounded-lg font-semibold">
                Miền Nam
            </button>
        </div>
    </div>
            
            <div class="flex-1 swiper university-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/neulogo.png" alt="NEU" />
                        <div class="overlay">
                            <p>NEU - Kinh Tế Quốc Dân</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/ftulogo.jpg" alt="FTU" />
                        <div class="overlay">
                            <p>FTU - Ngoại Thương</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/HUST.jpg" alt="HUST" />
                        <div class="overlay">
                            <p>HUST - Bách Khoa Hà Nội</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/FPTUCT.png" alt="FPT" />
                        <div class="overlay">
                            <p>FPT - Đại Học FPT</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/vanhienlogo.png" alt="VHU" />
                        <div class="overlay">
                            <p>VHU - Văn Hiến</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/yduoc.png" alt="UMP" />
                        <div class="overlay">
                            <p>UMP - Y Dược TP.HCM</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/UMP.jpg" alt="UMP HN" />
                        <div class="overlay">
                            <p>UMP - Y Dược Hà Nội</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/UED.jpg" alt="UED" />
                        <div class="overlay">
                            <p>UED - Sư Phạm Đà Nẵng</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/unilogo/bka.jpg" alt="BKA" />
                        <div class="overlay">
                            <p>BKA - Bách Khoa HCM</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
             <script src="${pageContext.request.contextPath}/layout/swiper.js"></script>
    </body>
</html>
