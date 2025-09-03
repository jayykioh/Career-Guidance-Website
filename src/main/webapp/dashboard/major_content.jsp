<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tra cứu ngành học</title>
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
                background: rgba(255, 255, 255, 0.9);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(128, 0, 0, 0.1);
                box-shadow: 0 25px 45px rgba(128, 0, 0, 0.08);
            }
            
            /* Search form glass effect */
            .search-form {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(15px);
                border: 1px solid rgba(128, 0, 0, 0.1);
            }
            
            /* Table glass effect */
            .table-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(15px);
                border: 1px solid rgba(128, 0, 0, 0.08);
            }
            
            /* Academic red color scheme */
            .academic-red {
                background: linear-gradient(135deg, #800000 0%, #a02020 100%);
            }
            
            .academic-red-light {
                background: rgba(128, 0, 0, 0.1);
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
            
            /* Hover effects */
            .hover-lift:hover {
                transform: translateY(-2px);
                box-shadow: 0 20px 40px rgba(128, 0, 0, 0.15);
            }
            
            /* Custom select styling */
            .custom-select {
                background: rgba(255, 255, 255, 0.9);
                border: 2px solid rgba(128, 0, 0, 0.1);
                transition: all 0.3s ease;
            }
            
            .custom-select:focus {
                border-color: #800000;
                box-shadow: 0 0 0 3px rgba(128, 0, 0, 0.1);
                background: rgba(255, 255, 255, 1);
            }
            
            /* Custom button styling */
            .search-btn {
                background: linear-gradient(135deg, #800000 0%, #a02020 100%);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
            }
            
            .search-btn::before {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(45deg, transparent 40%, rgba(255,255,255,0.1) 50%, transparent 60%);
                transform: translateX(-100%);
                transition: transform 0.6s ease;
            }
            
            .search-btn:hover::before {
                transform: translateX(100%);
            }
            
            .search-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(128, 0, 0, 0.3);
            }

            /* Scrollable container */
            .scrollable-results {
                max-height: calc(100vh - 300px);
                overflow-y: auto;
                scrollbar-width: thin;
                scrollbar-color: rgba(128, 0, 0, 0.3) rgba(128, 0, 0, 0.1);
            }

            .scrollable-results::-webkit-scrollbar {
                width: 8px;
            }

            .scrollable-results::-webkit-scrollbar-track {
                background: rgba(128, 0, 0, 0.1);
                border-radius: 4px;
            }

            .scrollable-results::-webkit-scrollbar-thumb {
                background: rgba(128, 0, 0, 0.3);
                border-radius: 4px;
            }

            .scrollable-results::-webkit-scrollbar-thumb:hover {
                background: rgba(128, 0, 0, 0.5);
            }
        </style>
    </head>
    <body class="clean-bg min-h-screen">
        
        <!-- Content -->
        <div class="flex flex-col min-h-screen">
            <div class="flex-shrink-0 mt-20 p-4 max-w-7xl mx-auto w-full">
                
                <!-- Header Section -->
                <div class="text-center mb-6 fade-in">
                    <div class="inline-flex items-center justify-center w-16 h-16 academic-red rounded-full mb-4 shadow-xl">
                        <i class="fas fa-graduation-cap text-2xl text-white"></i>
                    </div>
                    <h1 class="text-3xl font-bold text-gray-800 mb-3">Công cụ tra cứu tuyển sinh</h1>
                    <p class="text-gray-600 text-base">Tìm kiếm thông tin ngành học và chương trình đào tạo</p>
                    <div class="w-16 h-1 academic-red mx-auto mt-3 rounded-full"></div>
                </div>
                
                <!-- Search Form -->
                <div class="search-form rounded-xl p-6 mb-6 shadow-xl fade-in">
                    <form method="get" action="MajorController" class="flex gap-4 items-end">
                        <div class="flex-1">
                            <label class="block text-xs font-semibold text-gray-700 mb-2 uppercase tracking-wider">
                                <i class="fas fa-search mr-1 text-red-800"></i>
                                Chọn ngành học
                            </label>
                            <select name="keyword" class="custom-select w-full p-3 rounded-lg shadow-md focus:outline-none text-gray-700 font-medium text-sm">
                                <option value="">-- Chọn ngành học --</option>
                                <c:forEach var="group" items="${allGroups}">
                                    <optgroup label="${group.name}">
                                        <c:forEach var="major" items="${group.majors}">
                                            <option value="${major.name}" <c:if test="${param.keyword == major.name}">selected</c:if>>${major.name}</option>
                                        </c:forEach>
                                    </optgroup>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="search-btn px-6 py-3 text-white rounded-lg shadow-lg font-semibold text-sm relative overflow-hidden">
                            <i class="fas fa-search mr-1"></i>
                            Tìm kiếm
                        </button>
                    </form>
                </div>
            </div>
                
            <!-- Results Section - Scrollable -->
            <div class="flex-grow overflow-hidden px-4 pb-4">
                <div class="max-w-7xl mx-auto h-full">
                    <div class="scrollable-results fade-in">
                        <c:if test="${not empty groups}">
                            <c:forEach var="entry" items="${groups}">
                                <div class="mb-8">
                                    <!-- Group Header -->
                                    <div class="glass-card rounded-xl p-4 mb-4 hover-lift transition-all duration-300">
                                        <div class="flex items-center space-x-3">
                                            <div class="w-10 h-10 academic-red rounded-lg flex items-center justify-center">
                                                <i class="fas fa-layer-group text-white text-lg"></i>
                                            </div>
                                            <div>
                                                <h2 class="text-xl font-bold text-gray-800">${entry.name}</h2>
                                                <p class="text-gray-600 text-sm">Nhóm ngành đào tạo</p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Table Container -->
                                    <div class="table-container rounded-xl overflow-hidden shadow-xl">
                                        <table class="min-w-full">
                                            <thead class="academic-red text-white">
                                                <tr>
                                                    <th class="text-left px-6 py-3 font-bold uppercase tracking-wider text-sm">
                                                        <i class="fas fa-hashtag mr-1"></i>
                                                        Mã ngành
                                                    </th>
                                                    <th class="text-left px-6 py-3 font-bold uppercase tracking-wider text-sm">
                                                        <i class="fas fa-book-open mr-1"></i>
                                                        Tên ngành
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody class="bg-white divide-y divide-gray-100">
                                                <c:forEach var="major" items="${entry.majors}">
                                                    <tr onclick="location.href = '${pageContext.request.contextPath}/MajorDetailController?id=${major.id}'"
                                                        class="hover:bg-red-50 hover:scale-[1.01] hover:shadow-md transition-all duration-300 ease-in-out cursor-pointer group">
                                                        <td class="px-6 py-4 whitespace-nowrap">
                                                            <div class="flex items-center space-x-2">
                                                                <div class="w-8 h-8 academic-red-light rounded-md flex items-center justify-center group-hover:bg-red-100 transition-colors">
                                                                    <span class="font-bold text-red-800 text-sm">#</span>
                                                                </div>
                                                                <span class="font-bold text-gray-800 text-sm">${major.id}</span>
                                                            </div>
                                                        </td>
                                                        <td class="px-6 py-4 whitespace-nowrap">
                                                            <div class="flex items-center justify-between">
                                                                <span class="text-gray-700 font-medium text-sm">${major.name}</span>
                                                                <i class="fas fa-chevron-right text-red-600 opacity-0 group-hover:opacity-100 transition-opacity duration-300 text-sm"></i>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        
                        <!-- Empty State -->
                        <c:if test="${empty groups && not empty param.keyword}">
                            <div class="glass-card rounded-xl p-8 text-center">
                                <div class="w-16 h-16 academic-red-light rounded-full flex items-center justify-center mx-auto mb-4">
                                    <i class="fas fa-search text-2xl text-red-600"></i>
                                </div>
                                <h3 class="text-lg font-bold text-gray-800 mb-3">Không tìm thấy kết quả</h3>
                                <p class="text-gray-600 text-sm">Vui lòng thử tìm kiếm với từ khóa khác</p>
                            </div>
                        </c:if>
                        
                        <!-- Initial State -->
                        <c:if test="${empty groups && empty param.keyword}">
                            <div class="glass-card rounded-xl p-8 text-center">
                                <div class="w-16 h-16 academic-red-light rounded-full flex items-center justify-center mx-auto mb-4">
                                    <i class="fas fa-graduation-cap text-2xl text-red-600"></i>
                                </div>
                                <h3 class="text-lg font-bold text-gray-800 mb-3">Chào mừng đến với hệ thống tra cứu</h3>
                                <p class="text-gray-600 text-sm">Chọn ngành học từ danh sách và nhấn tìm kiếm để xem thông tin chi tiết</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>