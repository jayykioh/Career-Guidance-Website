
<html>
    <head>
        <title>Nguyen Vong</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.css">

        <style>
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-fade-in {
                animation: fadeIn 2s ease-out forwards;
            }


            @keyframes slideInLeft {
                from {
                    opacity: 0;
                    transform: translateX(-50px);
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            .animate-slide-in-left {
                animation: slideInLeft 0.8s ease-out forwards;
            }

        </style>


    </head>
    <body>
        <div class="header">
            <jsp:include page="layout/header.jsp" />
        </div>

        <div class="layout-container">

            <!--            <div class="sidebar"
                        </div>-->

            <div class="main-content">
                <jsp:include page="layout/herosection.jsp" />
                <jsp:include page="layout/universityswiper.jsp"/>
                 <jsp:include page="layout/testimonial.jsp"/>
            </div>
            <%@ include file="AIassistant.jsp" %>
            <jsp:include page="layout/footer.jsp"/>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/layout/swiper.js"></script>

    </body>
</html>
