<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>RIASEC Career Test</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="min-h-screen bg-gray-100 font-sans">
        <div class="flex min-h-screen">
            <!-- Sidebar -->
            <div class="w-[15%]">
                <%-- Sidebar content --%>
                <jsp:include page="/dashboard/sidebar.jsp" />
            </div>

            <!-- Main Content -->
            <div class="flex flex-col w-[85%]">
                <!-- Hero Top -->
                <div class="h-[25vh] bg-red-100 flex items-center justify-center">
                    <h2 class="text-4xl md:text-5xl font-bold text-red-800 drop-shadow-sm">
                        Bài kiểm tra nguyện vọng
                    </h2>
                </div>

                <!-- Hero Bottom -->
                <div class="relative h-[75vh] bg-red-700 flex flex-col items-center justify-center text-white px-6 text-center">
                    <!-- Divider Shape -->
                    <svg class="absolute -top-px left-0 w-full h-20" viewBox="0 0 1200 80" preserveAspectRatio="none">
                        <path d="M0,40 L300,0 L600,40 L900,0 L1200,40 L1200,0 L0,0 Z" fill="#F8DADA"></path>
                    </svg>

                    <div class="max-w-3xl text-2xl md:text-3xl font-semibold drop-shadow-md leading-relaxed">
                        "Đôi khi, điều ta cần không phải là chọn đúng, mà là hiểu mình đủ để bắt đầu."
                    </div>

                    <div class="mt-6 max-w-2xl text-sm md:text-base font-light text-white/90 leading-relaxed drop-shadow-sm">
                        Chỉ mất 10 phút, chúng ta hãy cùng nhau tìm hướng đi phù hợp với con người bạn.
                    </div>

                    <a href="${pageContext.request.contextPath}/riasec-test"
                       class="mt-10 inline-block bg-white text-red-800 font-semibold text-lg px-8 py-3 rounded-full shadow-md hover:bg-gray-200 transition-all duration-300">
                        Làm bài kiểm tra
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>