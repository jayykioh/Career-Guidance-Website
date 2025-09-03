<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết ngành</title>
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
            
            /* Hover effects */
            .hover-lift:hover {
                transform: translateY(-2px);
                box-shadow: 0 20px 40px rgba(137, 12, 37, 0.15);
            }
            
            /* University card hover effect */
            .university-card:hover {
                background: rgba(255, 255, 255, 0.98);
                border-color: rgba(137, 12, 37, 0.2);
                transform: translateY(-1px);
            }
            
            /* Scrollable container */
            .scrollable-content {
                max-height: calc(100vh - 200px);
                overflow-y: auto;
                scrollbar-width: thin;
                scrollbar-color: rgba(137, 12, 37, 0.3) rgba(137, 12, 37, 0.1);
            }

            .scrollable-content::-webkit-scrollbar {
                width: 6px;
            }

            .scrollable-content::-webkit-scrollbar-track {
                background: rgba(137, 12, 37, 0.1);
                border-radius: 3px;
            }

            .scrollable-content::-webkit-scrollbar-thumb {
                background: rgba(137, 12, 37, 0.3);
                border-radius: 3px;
            }

            .scrollable-content::-webkit-scrollbar-thumb:hover {
                background: rgba(137, 12, 37, 0.5);
            }
            
            /* Button styling */
            .website-btn {
                background: linear-gradient(135deg, #890C25 0%, #a51930 100%);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
            }
            
            .website-btn::before {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(45deg, transparent 40%, rgba(255,255,255,0.1) 50%, transparent 60%);
                transform: translateX(-100%);
                transition: transform 0.6s ease;
            }
            
            .website-btn:hover::before {
                transform: translateX(100%);
            }
            
            .website-btn:hover {
                transform: translateY(-1px);
                box-shadow: 0 8px 20px rgba(137, 12, 37, 0.3);
            }
        </style>
    </head>
    <body class="clean-bg min-h-screen">
        <div class="flex flex-col min-h-screen">
            <!-- Header Section -->
            <div class="flex-shrink-0 mt-8 p-4 max-w-6xl mx-auto w-full">
                <div class="glass-card rounded-xl p-6 mb-6 fade-in">
                    <div class="flex items-center space-x-4 mb-4">
                        <div class="w-12 h-12 academic-red rounded-lg flex items-center justify-center">
                            <i class="fas fa-graduation-cap text-white text-xl"></i>
                        </div>
                        <div>
                            <h1 class="text-2xl font-bold text-[#890C25]">${major.name}</h1>
                            <p class="text-gray-600 text-sm">Chi tiết ngành học</p>
                        </div>
                    </div>
                    <div class="border-l-4 border-[#890C25] pl-4 bg-gray-50 p-3 rounded-r-lg">
                        <p class="text-gray-700 text-sm">
                            <span class="font-semibold text-gray-800">Mã ngành:</span> 
                            <span class="font-bold text-[#890C25]">${major.id}</span>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Universities Section -->
            <div class="flex-grow overflow-hidden px-4 pb-4">
                <div class="max-w-6xl mx-auto h-full">
                    <div class="glass-card rounded-xl p-6 h-full fade-in">
                        <div class="flex items-center space-x-3 mb-4">
                            <div class="w-8 h-8 academic-red rounded-md flex items-center justify-center">
                                <i class="fas fa-university text-white text-sm"></i>
                            </div>
                            <h2 class="text-lg font-semibold text-[#890C25]">Các trường tuyển ngành này</h2>
                        </div>

                        <div class="scrollable-content">
                            <div class="space-y-3">
                                <c:forEach var="u" items="${universities}">
                                    <div class="university-card glass-card rounded-lg p-4 border transition-all duration-300 cursor-pointer hover-lift"
                                         onclick="toggleAdmission('${fn:replace(u.university_id, ' ', '')}')">
                                        
                                        <!-- University Header -->
                                        <div class="flex items-center gap-3">
                                            <div class="w-10 h-10 academic-red-light rounded-lg flex items-center justify-center">
                                                <i class="fas fa-university text-[#890C25] text-lg"></i>
                                            </div>
                                            <div class="flex-1">
                                                <p class="font-semibold text-gray-800 text-base">${u.university_name}</p>
                                                <div class="flex items-center gap-1 text-sm text-gray-600">
                                                    <i class="fas fa-map-marker-alt text-xs"></i>
                                                    <span>${u.location}</span>
                                                </div>
                                            </div>
                                            <div class="text-[#890C25]">
                                                <i class="fas fa-chevron-down text-sm transition-transform duration-300" 
                                                   id="chevron-${fn:replace(u.university_id, ' ', '')}"></i>
                                            </div>
                                        </div>

                                        <!-- Admission Details (Hidden by default) -->
                                        <div id="admission-${fn:replace(u.university_id, ' ', '')}" class="mt-4 hidden">
                                            <div class="border-t pt-3">
                                                <h3 class="text-sm font-semibold text-gray-700 mb-3 flex items-center gap-2">
                                                    <i class="fas fa-chart-line text-[#890C25] text-xs"></i>
                                                    Điểm tuyển sinh các năm
                                                </h3>
                                                
                                                <div class="overflow-x-auto">
                                                    <table class="w-full text-sm">
                                                        <thead>
                                                            <tr class="border-b-2 border-[#890C25]">
                                                                <th class="text-left py-2 px-3 font-semibold text-[#890C25] text-xs uppercase tracking-wider">
                                                                    <i class="fas fa-calendar mr-1"></i>Năm
                                                                </th>
                                                                <th class="text-left py-2 px-3 font-semibold text-[#890C25] text-xs uppercase tracking-wider">
                                                                    <i class="fas fa-star mr-1"></i>Điểm chuẩn
                                                                </th>
                                                                <th class="text-left py-2 px-3 font-semibold text-[#890C25] text-xs uppercase tracking-wider">
                                                                    <i class="fas fa-layer-group mr-1"></i>Tổ hợp
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:set var="linkRendered" value="false" scope="page" />
                                                            <c:forEach var="a" items="${admissions}">
                                                                <c:if test="${a.universityId == u.university_id}">
                                                                    <tr class="border-b border-gray-100 hover:bg-gray-50">
                                                                        <td class="py-2 px-3 text-gray-700">${a.year}</td>
                                                                        <td class="py-2 px-3 font-semibold text-[#890C25]">${a.score}</td>
                                                                        <td class="py-2 px-3 text-gray-700">
                                                                            <span class="bg-gray-100 px-2 py-1 rounded text-xs font-medium">${a.combinationCode}</span>
                                                                        </td>
                                                                    </tr>
                                                                    <c:set var="linkRendered" value="true" scope="page" />
                                                                </c:if>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <c:if test="${linkRendered}">
                                                    <div class="mt-4 pt-3 border-t">
                                                        <a href="${u.url_pattern}" target="_blank"
                                                           class="website-btn inline-flex items-center gap-2 text-white px-4 py-2 rounded-lg text-sm font-semibold relative overflow-hidden">
                                                            <i class="fas fa-external-link-alt text-xs"></i>
                                                            Vào website trường
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Empty State -->
                            <c:if test="${empty universities}">
                                <div class="glass-card rounded-lg p-8 text-center">
                                    <div class="w-16 h-16 academic-red-light rounded-full flex items-center justify-center mx-auto mb-4">
                                        <i class="fas fa-university text-2xl text-[#890C25]"></i>
                                    </div>
                                    <h3 class="text-lg font-bold text-gray-800 mb-2">Chưa có thông tin trường</h3>
                                    <p class="text-gray-600 text-sm">Hiện tại chưa có trường nào tuyển ngành này</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function toggleAdmission(universityId) {
                const admissionDiv = document.getElementById(`admission-${universityId}`);
                const chevron = document.getElementById(`chevron-${universityId}`);
                
                if (admissionDiv.classList.contains('hidden')) {
                    admissionDiv.classList.remove('hidden');
                    chevron.style.transform = 'rotate(180deg)';
                } else {
                    admissionDiv.classList.add('hidden');
                    chevron.style.transform = 'rotate(0deg)';
                }
            }
        </script>
    </body>
</html>