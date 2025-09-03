<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>${universityName} - Chi tiết trường</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            }
            
            html, body {
                height: 100%; 
            }
            
            /* Simple clean background */
            .clean-bg {
                background: #fafafa;
            }
            
            /* Glass card effect */
            .glass-card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(15px);
                border: 1px solid rgba(137, 12, 37, 0.1);
                box-shadow: 0 15px 35px rgba(137, 12, 37, 0.08);
            }
            
            /* Academic red color scheme */
            .academic-red {
                background: linear-gradient(135deg, #890C25 0%, #a51930 100%);
            }
            
            .academic-red-light {
                background: rgba(137, 12, 37, 0.1);
            }
            
            /* Fade in animation */
            .fade-in {
                animation: fadeIn 0.8s ease-out;
            }
            
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
            
            /* Hero section styling */
            .hero-section {
                background: linear-gradient(135deg, #890C25 0%, #a51930 100%);
                position: relative;
                overflow: hidden;
            }
            
            .hero-overlay {
                position: absolute;
                inset: 0;
                background: rgba(0, 0, 0, 0.4);
            }
            
            /* Button styling */
            .action-btn {
                background: linear-gradient(135deg, #890C25 0%, #a51930 100%);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
            }
            
            .action-btn::before {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(45deg, transparent 40%, rgba(255,255,255,0.1) 50%, transparent 60%);
                transform: translateX(-100%);
                transition: transform 0.6s ease;
            }
            
            .action-btn:hover::before {
                transform: translateX(100%);
            }
            
            .action-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(137, 12, 37, 0.3);
            }
            
            /* Major card hover effect */
            .major-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 20px 40px rgba(137, 12, 37, 0.15);
            }
        </style>
    </head>
    <body class="clean-bg text-gray-800 min-h-screen overflow-y-auto">
        
        <!-- Hero Section -->
        <div class="relative h-[250px] bg-black">
            <img src="${pageContext.request.contextPath}/images/universities/${universityCode}.jpg"
                 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/universities/default.jpg';"
                 class="w-full h-full object-cover opacity-30" alt="University Background">
            <div class="absolute inset-0 flex flex-col justify-center items-center text-white text-center px-4">
                <h1 class="text-3xl font-bold mb-2">${universityName}</h1>
                <div class="flex items-center justify-center gap-2 text-sm">
                    <i class="fas fa-university"></i>
                    <span>Mã trường: <span class="font-semibold">${universityCode}</span></span>
                </div>
            </div>
        </div>

        <!-- Content Section -->
        <div class="max-w-6xl mx-auto py-6 px-4">
            
            <!-- General Info Grid -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8 fade-in">
                
                <!-- Main Info -->
                <div class="lg:col-span-2">
                    <div class="glass-card rounded-xl p-6">
                        <div class="flex items-center gap-3 mb-4">
                            <div class="w-10 h-10 academic-red rounded-lg flex items-center justify-center">
                                <i class="fas fa-info-circle text-white"></i>
                            </div>
                            <h2 class="text-xl font-bold text-[#890C25]">Giới thiệu chung</h2>
                        </div>
                        
                        <div class="space-y-3 text-sm">
                            <div class="flex items-center gap-2">
                                <i class="fas fa-map text-[#890C25] w-4"></i>
                                <span><strong>Vùng tuyển sinh:</strong> ${universityRegion}</span>
                            </div>
                            <div class="flex items-center gap-2">
                                <i class="fas fa-map-marker-alt text-[#890C25] w-4"></i>
                                <span><strong>Địa điểm:</strong> ${universityLocation}</span>
                            </div>
                            <div class="flex items-center gap-2">
                                <i class="fas fa-globe text-[#890C25] w-4"></i>
                                <span><strong>Trang web:</strong> 
                                    <a href="${universityWebsite}" target="_blank" class="text-blue-600 underline hover:text-blue-800 ml-1">
                                        Website Trường ${universityName}
                                    </a>
                                </span>
                            </div>
                        </div>
                        
                        <div class="mt-4 p-4 bg-gray-50 rounded-lg">
                            <p class="text-sm text-gray-700">
                                Trường đại học <span class="font-semibold">${universityName}</span> là một trong những cơ sở đào tạo hàng đầu tại khu vực
                                <span class="font-semibold">${universityRegion}</span>, với đội ngũ giảng viên chất lượng và chương trình đào tạo tiên tiến.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Announcement Sidebar -->
                <div class="glass-card rounded-xl p-6">
                    <div class="flex items-center gap-2 mb-4">
                        <div class="w-8 h-8 academic-red rounded-md flex items-center justify-center">
                            <i class="fas fa-bullhorn text-white text-sm"></i>
                        </div>
                        <h3 class="text-lg font-bold text-[#890C25]">Thông báo tuyển sinh</h3>
                    </div>
                    
                    <div class="space-y-3 text-sm">
                        <div class="flex items-start gap-2">
                            <i class="fas fa-calendar-alt text-[#890C25] mt-1 text-xs"></i>
                            <span>Thời gian xét tuyển đợt 1: <strong>01/08 - 20/08/2025</strong></span>
                        </div>
                        <div class="flex items-start gap-2">
                            <i class="fas fa-users text-[#890C25] mt-1 text-xs"></i>
                            <span>Chỉ tiêu tuyển sinh: <strong>1.500 sinh viên</strong></span>
                        </div>
                        <div class="flex items-start gap-2">
                            <i class="fas fa-trophy text-[#890C25] mt-1 text-xs"></i>
                            <span>Học bổng cho sinh viên đạt từ <strong>27 điểm trở lên</strong></span>
                        </div>
                        <div class="flex items-start gap-2">
                            <i class="fas fa-home text-[#890C25] mt-1 text-xs"></i>
                            <span>Hỗ trợ ký túc xá cho tân sinh viên</span>
                        </div>
                    </div>
                    
                    <button class="action-btn w-full mt-4 px-4 py-2 text-white rounded-lg text-sm font-semibold relative overflow-hidden">
                        <i class="fas fa-pen-fancy mr-2"></i>
                        Đăng ký xét tuyển
                    </button>
                </div>
            </div>

            <!-- Majors Section -->
            <div class="fade-in">
                <div class="text-center mb-6">
                    <div class="inline-flex items-center gap-3 mb-4">
                        <div class="w-12 h-12 academic-red rounded-lg flex items-center justify-center">
                            <i class="fas fa-graduation-cap text-white text-xl"></i>
                        </div>
                        <h2 class="text-2xl font-bold text-[#890C25]">Danh sách ngành đào tạo</h2>
                    </div>
                </div>

                <c:if test="${not empty majors}">
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                        <c:forEach var="m" items="${majors}">
                            <div class="major-card glass-card rounded-xl overflow-hidden transition-all duration-300">
                                <div class="academic-red px-4 py-3 text-white">
                                    <h3 class="text-lg font-bold flex items-center gap-2">
                                        <i class="fas fa-book text-sm"></i>
                                        Mã: ${m.id}
                                    </h3>
                                </div>
                                <div class="p-4">
                                    <p class="text-gray-800 font-semibold mb-2 text-sm">${m.name}</p>
                                    <p class="text-xs text-gray-600">Chương trình đào tạo tiên tiến, sát với nhu cầu thực tiễn.</p>
                                    <div class="mt-3 flex items-center gap-2">
                                        <div class="w-6 h-6 academic-red-light rounded flex items-center justify-center">
                                            <i class="fas fa-arrow-right text-[#890C25] text-xs"></i>
                                        </div>
                                        <span class="text-xs text-gray-500">Xem chi tiết</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

                <c:if test="${empty majors}">
                    <div class="glass-card rounded-xl p-8 text-center">
                        <div class="w-16 h-16 academic-red-light rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-search text-2xl text-[#890C25]"></i>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-2">Không có ngành đào tạo</h3>
                        <p class="text-sm text-gray-600">Hiện tại chưa có thông tin về các ngành đào tạo tại trường này.</p>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>