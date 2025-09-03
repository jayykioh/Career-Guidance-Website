<html>
    <head>
        <title>Dashboard Layout</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.css">
    </head>
    <body>

        <div class="header">  
        </div>

        <div class="layout-container flex">
            <div class=" w-[15%] h-full">
                <jsp:include page="dashboard/sidebar.jsp" />   
            </div>
            <div class="w-[85%] ">
                <jsp:include page="dashboard/major_content.jsp"/>
            </div>
                
        </div>
         
            
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="js/tablehandling.js" ></script>
    </body>
</html>
