<!-- dashboard_layout.jsp -->
<html>
<head>
    <title>Dashboard Layout</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.css">
</head>
<body class="h-screen overflow-hidden">
    <div class="layout-container flex h-screen">
   
        <div class="w-[15%] h-full overflow-hidden">
            <jsp:include page="dashboard/sidebar.jsp" />   
        </div>

    
        <div class="w-[85%] h-full overflow-y-auto">
            <jsp:include page="dashboard/uni_majo.jsp"/>
        </div>
        

        
    </div>


    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="js/tablehandling.js" ></script>
    <script src="${pageContext.request.contextPath}/js/toggleadmission.js"></script>
</body>
</html>
