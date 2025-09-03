<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes fadeInDown {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fade-in-down {
            animation: fadeInDown 0.8s ease-out both;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-100 to-gray-200 flex items-center justify-center min-h-screen">

    <div class="bg-white/80 backdrop-blur-xl rounded-3xl shadow-2xl p-10 max-w-lg text-center space-y-6 animate-fade-in-down border border-[#e0dcdc]">
       
        <div class="text-6xl text-[#890C25] animate-bounce-slow">🔔</div>

       
        <h1 class="text-3xl font-extrabold text-[#890C25] tracking-wide">Notifications</h1>

        
        <p class="text-gray-700 text-lg leading-relaxed">
            Oops! This page is not available yet.<br>
            We’re working hard to bring it to you soon.
        </p>

     
        <a href="${pageContext.request.contextPath}/dashboard.jsp"
           class="inline-block px-6 py-3 bg-[#890C25] text-white text-sm font-semibold rounded-full shadow hover:bg-[#a91430] hover:scale-105 transition-all duration-300 ease-in-out">
            ← Back to Home
        </a>
    </div>

</body>
</html>
