<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Access Denied</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(40px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.7s ease-out both;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-100 to-gray-200 min-h-screen flex items-center justify-center">

    <div class="bg-white/80 backdrop-blur-lg shadow-2xl rounded-2xl p-10 text-center max-w-md border border-red-300 fade-in-up">
        <div class="mb-6 animate-pulse">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-red-600 mx-auto drop-shadow-md" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.29 3.86L1.82 18a1 1 0 00.85 1.5h18.66a1 1 0 00.85-1.5L13.71 3.86a1 1 0 00-1.71 0zM12 9v4m0 4h.01" />
            </svg>
        </div>
        <h1 class="text-3xl font-extrabold text-red-700 mb-3 tracking-wide">Access Denied</h1>
        <p class="text-gray-700 mb-6 leading-relaxed">
            This feature is reserved for our <span class="font-bold text-black">Premium Members</span>.  
            Please upgrade to enjoy full access.
        </p>

        <div class="flex justify-center gap-4">
            <a href="${pageContext.request.contextPath}/profile"
               class="bg-[#800000] text-white px-5 py-2 rounded-md shadow-md hover:bg-[#a00000] hover:scale-105 transition-all duration-300 ease-in-out">
                Upgrade Now
            </a>

            <a href="${pageContext.request.contextPath}/landingpage.jsp"
               class="border border-[#800000] text-[#800000] px-5 py-2 rounded-md shadow-md hover:bg-gray-100 hover:scale-105 transition-all duration-300 ease-in-out">
                Back to Home
            </a>
        </div>
    </div>

</body>
</html>
