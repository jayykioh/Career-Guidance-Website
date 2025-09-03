<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.LocalDate" %>
<html>
    <head>
        <title>Thông tin cá nhân</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            }

            .learning-gradient {
                background: linear-gradient(135deg, #730D0D, #1F2937);
            }

            .gradient-bg {
                background: linear-gradient(135deg, #800000 0%, #600000 100%);
                position: relative;
                overflow: hidden;
            }

            /* Dynamic floating shapes */
            .floating-shapes {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                pointer-events: none;
            }

            .shape {
                position: absolute;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.05);
                animation: float 20s infinite linear;
            }

            .shape:nth-child(1) {
                width: 80px;
                height: 80px;
                left: 10%;
                animation-delay: 0s;
                animation-duration: 20s;
            }

            .shape:nth-child(2) {
                width: 120px;
                height: 120px;
                left: 20%;
                animation-delay: 2s;
                animation-duration: 25s;
            }

            .shape:nth-child(3) {
                width: 60px;
                height: 60px;
                left: 70%;
                animation-delay: 4s;
                animation-duration: 22s;
            }

            .shape:nth-child(4) {
                width: 100px;
                height: 100px;
                left: 80%;
                animation-delay: 6s;
                animation-duration: 28s;
            }

            .shape:nth-child(5) {
                width: 40px;
                height: 40px;
                left: 50%;
                animation-delay: 8s;
                animation-duration: 18s;
            }

            .shape:nth-child(6) {
                width: 160px;
                height: 160px;
                left: 30%;
                animation-delay: 10s;
                animation-duration: 30s;
            }

            .shape:nth-child(7) {
                width: 90px;
                height: 90px;
                left: 60%;
                animation-delay: 12s;
                animation-duration: 24s;
            }

            .shape:nth-child(8) {
                width: 70px;
                height: 70px;
                left: 40%;
                animation-delay: 14s;
                animation-duration: 26s;
            }

            @keyframes float {
                0% {
                    transform: translateY(100vh) rotate(0deg);
                    opacity: 0;
                }
                10% {
                    opacity: 1;
                }
                90% {
                    opacity: 1;
                }
                100% {
                    transform: translateY(-100px) rotate(360deg);
                    opacity: 0;
                }
            }

            /* Animated gradient overlay */
            .gradient-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: linear-gradient(45deg,
                    rgba(128, 0, 0, 0.1) 0%,
                    rgba(160, 32, 32, 0.1) 25%,
                    rgba(96, 0, 0, 0.1) 50%,
                    rgba(128, 0, 0, 0.1) 75%,
                    rgba(160, 32, 32, 0.1) 100%);
                background-size: 400% 400%;
                animation: gradientShift 15s ease infinite;
            }

            @keyframes gradientShift {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }

            /* Pulsing rings */
            .pulse-ring {
                position: absolute;
                border: 2px solid rgba(255, 255, 255, 0.1);
                border-radius: 50%;
                animation: pulse 4s cubic-bezier(0.455, 0.03, 0.515, 0.955) infinite;
            }

            .pulse-ring-1 {
                width: 200px;
                height: 200px;
                top: 20%;
                right: 10%;
                animation-delay: 0s;
            }

            .pulse-ring-2 {
                width: 300px;
                height: 300px;
                bottom: 30%;
                left: -50px;
                animation-delay: 2s;
            }

            .pulse-ring-3 {
                width: 150px;
                height: 150px;
                top: 60%;
                right: 20%;
                animation-delay: 1s;
            }

            @keyframes pulse {
                0% {
                    transform: scale(0.8);
                    opacity: 1;
                }
                100% {
                    transform: scale(1.5);
                    opacity: 0;
                }
            }

            /* Particle trail effect */
            .particle {
                position: absolute;
                width: 4px;
                height: 4px;
                background: rgba(255, 255, 255, 0.3);
                border-radius: 50%;
                animation: particle 8s linear infinite;
            }

            .particle:nth-child(odd) {
                animation-delay: 0s;
                animation-duration: 8s;
            }

            .particle:nth-child(even) {
                animation-delay: 4s;
                animation-duration: 12s;
            }

            @keyframes particle {
                0% {
                    transform: translateX(-100px) translateY(100vh);
                    opacity: 0;
                }
                10% {
                    opacity: 1;
                }
                90% {
                    opacity: 1;
                }
                100% {
                    transform: translateX(100vw) translateY(-100px);
                    opacity: 0;
                }
            }

            /* Geometric patterns */
            .geometric-bg {
                position: absolute;
                width: 100%;
                height: 100%;
                background-image:
                    radial-gradient(circle at 20% 20%, rgba(255,255,255,0.05) 1px, transparent 1px),
                    radial-gradient(circle at 80% 80%, rgba(255,255,255,0.05) 1px, transparent 1px),
                    radial-gradient(circle at 40% 60%, rgba(255,255,255,0.03) 1px, transparent 1px);
                background-size: 50px 50px, 30px 30px, 70px 70px;
                background-position: 0 0, 25px 25px, 10px 40px;
                animation: backgroundMove 20s linear infinite;
            }

            @keyframes backgroundMove {
                0% {
                    transform: translate(0, 0);
                }
                100% {
                    transform: translate(50px, 50px);
                }
            }

            .glass-card {
                backdrop-filter: blur(20px);
                background: rgba(255, 255, 255, 0.95);
                position: relative;
                z-index: 10;
            }

            /* Card entrance animation */
            .card-entrance {
                animation: cardSlideIn 0.8s ease-out;
            }

            @keyframes cardSlideIn {
                from {
                    opacity: 0;
                    transform: translateY(50px) scale(0.9);
                }
                to {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            .profile-avatar {
                background: linear-gradient(135deg, #730D0D, #991B1B);
                position: relative;
                overflow: hidden;
            }

            .profile-avatar::before {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(135deg, #64748b 0%, #94a3b8 100%);
                animation: shimmer 3s ease-in-out infinite;
            }

            @keyframes shimmer {
                0% {
                    transform: translateX(-100%);
                }
                100% {
                    transform: translateX(100%);
                }
            }

            .info-card {
                background: white;
                border: 1px solid #f1f5f9;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                position: relative;
                overflow: hidden;
            }

            .info-card::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 0;
                background: linear-gradient(90deg, #800000, #a855f7);
                transition: width 0.3s ease;
            }

            .info-card:hover::before {
                width: 4px;
            }

            .info-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
                border-color: rgba(128, 0, 0, 0.2);
            }

            .icon-wrapper {
                background: linear-gradient(135deg, rgba(128, 0, 0, 0.1), rgba(168, 85, 247, 0.1));
                backdrop-filter: blur(10px);
            }

            .vip-badge {
                background: linear-gradient(135deg, #730D0D, #991B1B);
                position: relative;
                overflow: hidden;
            }

            .vip-badge::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
                animation: rotate 4s linear infinite;
            }

            @keyframes rotate {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .regular-badge {
                background: linear-gradient(135deg, #4B5563, #1F2937);
                border: 2px dashed rgba(148, 163, 184, 0.3);
            }

            .upgrade-btn {
                background: linear-gradient(135deg, #730D0D, #F97316);
                position: relative;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .upgrade-btn::before {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(135deg, #FDE047, #F97316);
                transform: translateX(-100%);
                transition: transform 0.6s ease;
            }

            .upgrade-btn:hover::before {
                transform: translateX(100%);
            }

            .upgrade-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 20px 40px rgba(115, 13, 13, 0.5);
            }

            .learning-icon {
                background: linear-gradient(135deg, #730D0D, #991B1B);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .progress-bar {
                background: linear-gradient(90deg, #800000 0%, #a855f7 50%, #3b82f6 100%);
                height: 4px;
                border-radius: 2px;
                animation: progress 2s ease-in-out;
            }

            @keyframes progress {
                from {
                    width: 0;
                }
                to {
                    width: 100%;
                }
            }

            .micro-interaction {
                transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .micro-interaction:hover {
                transform: scale(1.02);
            }

            /* Debug info */
            .debug-info {
                background: rgba(0, 0, 0, 0.8);
                color: white;
                padding: 10px;
                border-radius: 8px;
                font-family: monospace;
                font-size: 12px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body class="min-h-screen gradient-bg flex items-center justify-center p-4">
      

        <!-- Animated Background Effects -->
        <div class="gradient-overlay"></div>
        <div class="geometric-bg"></div>

        <!-- Floating Shapes -->
        <div class="floating-shapes">
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
        </div>

        <!-- Pulsing Rings -->
        <div class="pulse-ring pulse-ring-1"></div>
        <div class="pulse-ring pulse-ring-2"></div>
        <div class="pulse-ring pulse-ring-3"></div>

        <!-- Particle Effects -->
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none;">
            <div class="particle" style="left: 10%;"></div>
            <div class="particle" style="left: 30%;"></div>
            <div class="particle" style="left: 50%;"></div>
            <div class="particle" style="left: 70%;"></div>
            <div class="particle" style="left: 90%;"></div>
        </div>

        <div class="w-full max-w-md">
            <!-- Main Profile Card -->
            <div class="glass-card rounded-3xl overflow-hidden shadow-2xl card-entrance">

                <!-- Header Section -->
                <div class="learning-gradient p-6 text-white relative">
                    <div class="text-center">
                        <!-- Avatar with Learning Theme -->
                        <div class="profile-avatar w-20 h-20 mx-auto mb-4 rounded-full flex items-center justify-center shadow-xl">
                            <i class="fas fa-user-graduate text-2xl text-white"></i>
                        </div>

                        <!-- Title with Learning Context -->
                        <h1 class="text-2xl font-bold mb-2">Hồ sơ tài khoản</h1>
                        <p class="text-white/80 text-sm font-medium">Thông tin cá nhân</p>

                        <!-- Progress Bar -->
                        <div class="progress-bar w-12 mx-auto mt-3"></div>
                    </div>

                    <!-- Floating Learning Icons -->
                    <div class="absolute top-4 right-4">
                        <i class="fas fa-brain text-white/30 text-2xl"></i>
                    </div>
                    <div class="absolute bottom-4 left-4">
                        <i class="fas fa-lightbulb text-white/30 text-xl"></i>
                    </div>
                </div>

                <!-- Profile Content -->
                <div class="p-6 space-y-5">

                    <!-- Student Information Cards -->
                    <div class="space-y-3">

                        <!-- Full Name -->
                        <div class="info-card micro-interaction p-4 rounded-2xl relative">
                            <div class="flex items-center space-x-3">
                                <div class="icon-wrapper w-12 h-12 rounded-xl flex items-center justify-center">
                                    <i class="fas fa-id-card text-lg learning-icon"></i>
                                </div>
                                <div class="flex-1">
                                    <label class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-1 block">Họ và tên</label>
                                    <p class="text-base font-bold text-gray-900">${currentUser.fullName}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="info-card micro-interaction p-4 rounded-2xl relative">
                            <div class="flex items-center space-x-3">
                                <div class="icon-wrapper w-12 h-12 rounded-xl flex items-center justify-center">
                                    <i class="fas fa-envelope text-lg learning-icon"></i>
                                </div>
                                <div class="flex-1">
                                    <label class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-1 block">Email học tập</label>
                                    <p class="text-base font-bold text-gray-900 break-all">${currentUser.email}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Username -->
                        <div class="info-card micro-interaction p-4 rounded-2xl relative">
                            <div class="flex items-center space-x-3">
                                <div class="icon-wrapper w-12 h-12 rounded-xl flex items-center justify-center">
                                    <i class="fas fa-user-circle text-lg learning-icon"></i>
                                </div>
                                <div class="flex-1">
                                    <label class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-1 block">Mã học viên</label>
                                    <p class="text-base font-bold text-gray-900">${currentUser.username}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Learning Membership Status -->
                    <div class="mt-6">
                        <label class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3 block">Gói học tập</label>

                        <!-- ✅ FIXED: Proper LocalDate check using Java code in scriptlet -->
                        <% 
                            Model.User currentUser = (Model.User) session.getAttribute("currentUser");
                            boolean hasActiveMembership = currentUser != null && 
                                                        currentUser.getMembershipExpiry() != null && 
                                                        currentUser.getMembershipExpiry().isAfter(LocalDate.now());
                            pageContext.setAttribute("hasActiveMembership", hasActiveMembership);
                        %>

                        <c:choose>
                            <c:when test="${hasActiveMembership}">
                                <!-- PREMIUM MEMBERSHIP -->
                                <div class="vip-badge text-white p-5 rounded-2xl relative">
                                    <div class="relative z-10">
                                        <div class="flex items-center justify-center space-x-2 mb-3">
                                            <i class="fas fa-crown text-yellow-300 text-lg"></i>
                                            <span class="text-lg font-bold">PREMIUM LEARNER</span>
                                            <i class="fas fa-medal text-yellow-300 text-lg"></i>
                                        </div>
                                        <div class="text-center">
                                            <div class="bg-white/20 rounded-lg p-2">
                                                <p class="text-sm font-semibold">
                                                    Hết hạn: 
                                                    <% 
                                                        if (currentUser != null && currentUser.getMembershipExpiry() != null) {
                                                            java.time.format.DateTimeFormatter formatter = 
                                                                java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy");
                                                            out.print(currentUser.getMembershipExpiry().format(formatter));
                                                        }
                                                    %>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- BASIC MEMBERSHIP -->
                                <div class="regular-badge text-white p-5 rounded-2xl relative bg-gradient-to-r from-gray-500 to-gray-600">
                                    <div class="text-center">
                                        <div class="flex items-center justify-center space-x-2">
                                            <i class="fas fa-book-open text-gray-200 text-lg"></i>
                                            <span class="text-lg font-bold">HỌC VIÊN CƠ BẢN</span>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Upgrade Learning Plan Button -->
                    <c:if test="${!hasActiveMembership}">
                        <form action="create-payment" method="POST">
                            <input type="hidden" value="50000" class="check">
                            <button type="submit"
                                    class="upgrade-btn w-full inline-flex items-center justify-center space-x-2 text-white font-bold py-3 px-5 rounded-2xl text-base relative overflow-hidden group">
                                <i class="fas fa-graduation-cap text-lg"></i>
                                <span>Nâng cấp gói học Premium</span>
                                <i class="fas fa-arrow-right group-hover:translate-x-1 transition-transform duration-300"></i>
                            </button>
                        </form>
                    </c:if>

                    <!-- Premium Member Benefits (only show for premium users) -->
                    <c:if test="${hasActiveMembership}">
                        <div class="bg-gradient-to-r from-green-50 to-green-100 p-4 rounded-2xl border border-green-200">
                            <div class="flex items-center space-x-2 mb-2">
                                <i class="fas fa-check-circle text-green-600"></i>
                                <span class="font-semibold text-green-800">Đặc quyền Premium</span>
                            </div>
                            <ul class="text-sm text-green-700 space-y-1">
                                <li>✨ Truy cập tất cả bài test cao cấp</li>
                                <li>🎯 Gợi ý nguyện vọng không giới hạn</li>
                                <li>📊 Báo cáo phân tích chi tiết</li>
                                <li>🏆 Hỗ trợ ưu tiên</li>
                            </ul>
                        </div>
                    </c:if>

                    <!-- Navigation -->
                    <div class="text-center pt-4 border-t border-gray-100">
                        <a href="landingpage.jsp" class="inline-flex items-center space-x-2 text-gray-600 hover:text-gray-800 transition-colors duration-200 font-medium text-sm">
                            <i class="fas fa-home"></i>
                            <span>Về trang học tập</span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Additional Info -->
            <div class="text-center mt-6">
                <p class="text-white text-sm">
                    Copyright ©Nhom Cui | All Right Reserved
                </p>
            </div>
        </div>

      
    </body>
</html>