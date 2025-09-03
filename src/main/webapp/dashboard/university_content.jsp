<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách trường đại học</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
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
                background: rgba(0, 0, 0, 0.3);
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
            
            /* Checkbox styling */
            .custom-checkbox {
                background: rgba(255, 255, 255, 0.95);
                border: 2px solid rgba(137, 12, 37, 0.2);
                transition: all 0.3s ease;
            }
            
            .custom-checkbox:hover {
                border-color: rgba(137, 12, 37, 0.4);
                transform: translateY(-1px);
                box-shadow: 0 5px 15px rgba(137, 12, 37, 0.1);
            }
            
            /* Table styling */
            .table-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(15px);
                border: 1px solid rgba(137, 12, 37, 0.08);
            }
            
            /* Scrollable container */
            .scrollable-table {
                max-height: calc(100vh - 350px);
                overflow-y: auto;
                scrollbar-width: thin;
                scrollbar-color: rgba(137, 12, 37, 0.3) rgba(137, 12, 37, 0.1);
            }

            .scrollable-table::-webkit-scrollbar {
                width: 6px;
            }

            .scrollable-table::-webkit-scrollbar-track {
                background: rgba(137, 12, 37, 0.1);
                border-radius: 3px;
            }

            .scrollable-table::-webkit-scrollbar-thumb {
                background: rgba(137, 12, 37, 0.3);
                border-radius: 3px;
            }

            .scrollable-table::-webkit-scrollbar-thumb:hover {
                background: rgba(137, 12, 37, 0.5);
            }
        </style>
    </head>
    <body class="clean-bg min-h-screen" data-context="${pageContext.request.contextPath}">
        <div class="flex flex-col min-h-screen">
            
            <!-- Hero Section -->
            <div class="flex-shrink-0 mt-6 mx-4">
                <div id="detailsBox" class="hero-section relative rounded-xl overflow-hidden shadow-xl fade-in">
                    <img id="universityImage"
                         src="${pageContext.request.contextPath}/images/universities/default.jpg"
                         alt="University Background"
                         class="absolute inset-0 w-full h-full object-cover" />
                    
                    <div class="hero-overlay"></div>
                    
                    <div class="relative text-white p-6">
                        <div class="flex items-end gap-6">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-4">
                                    <div class="w-12 h-12 bg-white bg-opacity-20 rounded-lg flex items-center justify-center">
                                        <i class="fas fa-university text-white text-xl"></i>
                                    </div>
                                    <div>
                                        <p class="text-white text-opacity-80 text-sm">Thông tin trường</p>
                                        <p class="text-white font-semibold">Chi tiết</p>
                                    </div>
                                </div>
                                <span id="detailCode" class="text-4xl font-bold block mb-2"></span>
                                <span id="detailName" class="text-lg block"></span>
                            </div>
                            
                            <div class="text-right space-y-2">
                                <div class="flex items-center gap-2">
                                    <i class="fas fa-map text-sm"></i>
                                    <span class="text-sm"><strong>Vùng:</strong> <span id="detailRegion"></span></span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <i class="fas fa-map-marker-alt text-sm"></i>
                                    <span class="text-sm"><strong>Địa điểm:</strong> <span id="detailLocation"></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="flex-shrink-0 px-4 py-4">
                <div class="flex flex-wrap gap-3 fade-in">
                    <a id="majorLink" href="#" 
                       class="action-btn inline-flex items-center gap-2 px-4 py-2 text-white rounded-lg text-sm font-semibold relative overflow-hidden">
                        <i class="fas fa-info-circle text-xs"></i>
                        Tìm hiểu thêm
                    </a>
                    
                    <a id="websiteLink" href="#" target="_blank"
                       class="action-btn inline-flex items-center gap-2 px-4 py-2 text-white rounded-lg text-sm font-semibold relative overflow-hidden">
                        <i class="fas fa-external-link-alt text-xs"></i>
                        Trang web trường
                    </a>
                    
                    <label class="custom-checkbox inline-flex items-center gap-2 px-4 py-2 rounded-lg cursor-pointer">
                        <input type="checkbox" class="w-4 h-4 accent-[#890C25] transition-transform hover:scale-110" />
                        <span class="text-gray-800 font-medium text-sm">Đánh dấu trường này</span>
                    </label>
                </div>
            </div>

            <!-- Universities Table -->
            <div class="flex-grow overflow-hidden px-4 pb-4">
                <div class="h-full fade-in">
                    <div class="glass-card rounded-xl p-6 h-full">
                        <div class="flex items-center space-x-3 mb-4">
                            <div class="w-8 h-8 academic-red rounded-md flex items-center justify-center">
                                <i class="fas fa-list text-white text-sm"></i>
                            </div>
                            <h2 class="text-lg font-semibold text-[#890C25]">Danh sách trường đại học</h2>
                        </div>

                        <div class="table-container rounded-xl overflow-hidden">
                            <div class="scrollable-table">
                                <table class="min-w-full text-sm">
                                    <thead class="academic-red text-white sticky top-0">
                                        <tr>
                                            <th class="text-left px-4 py-3 font-semibold uppercase tracking-wider text-xs">
                                                <i class="fas fa-hashtag mr-1"></i>ID
                                            </th>
                                            <th class="text-left px-4 py-3 font-semibold uppercase tracking-wider text-xs">
                                                <i class="fas fa-code mr-1"></i>Mã
                                            </th>
                                            <th class="text-left px-4 py-3 font-semibold uppercase tracking-wider text-xs">
                                                <i class="fas fa-university mr-1"></i>Tên trường
                                            </th>
                                            <th class="text-left px-4 py-3 font-semibold uppercase tracking-wider text-xs">
                                                <i class="fas fa-map-marker-alt mr-1"></i>Địa điểm
                                            </th>
                                            <th class="text-left px-4 py-3 font-semibold uppercase tracking-wider text-xs">
                                                <i class="fas fa-map mr-1"></i>Vùng
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-100">
                                        <c:forEach var="u" items="${sessionScope.universities}">
                                            <tr class="group hover:bg-red-50 hover:scale-[1.01] hover:shadow-md transition-all duration-300 ease-in-out cursor-pointer"
                                                data-code="${u.university_code}"
                                                data-name="${u.university_name}"
                                                data-location="${u.location}"
                                                data-region="${u.region_name}"
                                                data-website="${u.url_pattern}">
                                                
                                                <td class="px-4 py-3">
                                                    <div class="flex items-center space-x-2">
                                                        <div class="w-6 h-6 academic-red-light rounded flex items-center justify-center group-hover:bg-red-100 transition-colors">
                                                            <span class="font-bold text-[#890C25] text-xs">#</span>
                                                        </div>
                                                        <span class="font-medium text-gray-700 text-sm">${u.university_id}</span>
                                                    </div>
                                                </td>
                                                
                                                <td class="px-4 py-3">
                                                    <span class="bg-[#890C25] text-white px-2 py-1 rounded text-xs font-bold">${u.university_code}</span>
                                                </td>
                                                
                                                <td class="px-4 py-3">
                                                    <div class="flex items-center justify-between">
                                                        <span class="text-gray-800 font-medium text-sm">${u.university_name}</span>
                                                        <i class="fas fa-chevron-right text-[#890C25] opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-xs"></i>
                                                    </div>
                                                </td>
                                                
                                                <td class="px-4 py-3">
                                                    <div class="flex items-center gap-1">
                                                        <i class="fas fa-map-marker-alt text-gray-400 text-xs"></i>
                                                        <span class="text-gray-600 text-sm">${u.location}</span>
                                                    </div>
                                                </td>
                                                
                                                <td class="px-4 py-3">
                                                    <span class="bg-gray-100 text-gray-700 px-2 py-1 rounded text-xs font-medium">${u.region_name}</span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Empty State -->
                        <c:if test="${empty sessionScope.universities}">
                            <div class="text-center py-12">
                                <div class="w-16 h-16 academic-red-light rounded-full flex items-center justify-center mx-auto mb-4">
                                    <i class="fas fa-university text-2xl text-[#890C25]"></i>
                                </div>
                                <h3 class="text-lg font-bold text-gray-800 mb-2">Chưa có dữ liệu</h3>
                                <p class="text-gray-600 text-sm">Danh sách trường đại học đang được cập nhật</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/js/tablehandling.js"></script>
    </body>
</html>