<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kết Quả</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: #F8DADA;
                min-height: 100vh;
                padding: 20px;
            }

            .container {
                max-width: 1000px;
                margin: 0 auto;
                background: white;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.2);
                overflow: hidden;
            }

            .header {
                background: linear-gradient(45deg, #800000, #CC4E5C);
                color: white;
                padding: 30px;
                text-align: center;
            }

            .header h1 {
                font-size: 2.5em;
                margin-bottom: 10px;
            }

            .user-name {
                font-size: 1.3em;
                opacity: 0.9;
            }

            .results-container {
                padding: 30px;
            }

            .results-intro {
                text-align: center;
                margin-bottom: 30px;
            }

            .results-intro h2 {
                color: #333;
                margin-bottom: 10px;
            }

            .results-intro p {
                color: #666;
                font-size: 1.1em;
            }

            .scores-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
                margin-bottom: 40px;
            }

            .score-card {
                background: #f8f9fa;
                border-radius: 15px;
                padding: 25px;
                border-left: 5px solid;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .score-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(204, 78, 92, 0.1);
            }

            /* Màu sắc cho từng loại */
            .score-card.realistic {
                border-left-color: #CC4E5C;
            }
            .score-card.investigative {
                border-left-color: #E06666;
            }
            .score-card.artistic {
                border-left-color: #F1948A;
            }
            .score-card.social {
                border-left-color: #F5B7B1;
            }
            .score-card.enterprising {
                border-left-color: #D98880;
            }
            .score-card.conventional {
                border-left-color: #B03A2E;
            }

            .score-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .score-title {
                font-size: 1.3em;
                font-weight: 600;
                color: #333;
            }

            .score-value {
                font-size: 2em;
                font-weight: bold;
                color: #CC4E5C;
            }

            .score-bar {
                height: 12px;
                background: #e9ecef;
                border-radius: 6px;
                overflow: hidden;
                margin-bottom: 10px;
            }

            .score-fill {
                height: 100%;
                border-radius: 6px;
                transition: width 1s ease-in-out;
            }

            /* Gradient cho thanh tiến độ */
            .score-fill.realistic {
                background: linear-gradient(45deg, #CC4E5C, #E06666);
            }
            .score-fill.investigative {
                background: linear-gradient(45deg, #E06666, #F1948A);
            }
            .score-fill.artistic {
                background: linear-gradient(45deg, #F1948A, #F5B7B1);
            }
            .score-fill.social {
                background: linear-gradient(45deg, #F5B7B1, #FADBD8);
            }
            .score-fill.enterprising {
                background: linear-gradient(45deg, #D98880, #CD6155);
            }
            .score-fill.conventional {
                background: linear-gradient(45deg, #B03A2E, #922B21);
            }

            .score-description {
                font-size: 0.9em;
                color: #666;
                line-height: 1.4;
            }

            .holland-code {
                text-align: center;
                margin: 40px 0;
                padding: 30px;
                background: linear-gradient(45deg, #800000, #CC4E5C);
                border-radius: 15px;
                color: white;
            }

            .holland-code h3 {
                font-size: 1.8em;
                margin-bottom: 10px;
            }

            .code-display {
                font-size: 3em;
                font-weight: bold;
                letter-spacing: 10px;
            }

            .careers-section {
                margin-top: 40px;
            }

            .careers-section h3 {
                color: #333;
                margin-bottom: 20px;
                font-size: 1.8em;
                text-align: center;
            }

            .careers-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
            }

            .career-card {
                background: white;
                border: 2px solid #e9ecef;
                border-radius: 10px;
                padding: 20px;
                transition: all 0.3s;
            }

            .career-card:hover {
                border-color: #CC4E5C;
                box-shadow: 0 5px 15px rgba(204, 78, 92, 0.2);
            }

            .career-title {
                font-size: 1.2em;
                font-weight: 600;
                color: #333;
                margin-bottom: 10px;
            }

            .career-type {
                display: inline-block;
                background: #CC4E5C;
                color: white;
                padding: 4px 12px;
                border-radius: 15px;
                font-size: 0.8em;
                margin-bottom: 10px;
            }

            .career-description {
                color: #666;
                line-height: 1.5;
            }

            .actions {
                text-align: center;
                margin-top: 40px;
            }

            .btn {
                display: inline-block;
                padding: 15px 30px;
                margin: 0 10px;
                border: none;
                border-radius: 25px;
                font-size: 1.1em;
                font-weight: 600;
                text-decoration: none;
                cursor: pointer;
                transition: all 0.3s;
            }

            .btn-primary {
                background: linear-gradient(45deg, #800000, #CC4E5C);
                color: white;
            }

            .btn-secondary {
                background: white;
                color: #CC4E5C;
                border: 2px solid #CC4E5C;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(204, 78, 92, 0.3);
            }

            .suggestion-container {
                max-width: 600px;
                margin: 40px auto;
                padding: 20px;
                border: 2px solid #00bcd4;
                border-radius: 10px;
                background-color: #f0faff;
                font-family: Arial, sans-serif;
            }
            .suggestion-container h2 {
                color: #007c91;
                text-align: center;
            }
            .suggestion-list {
                list-style-type: none;
                padding: 0;
            }
            .suggestion-list li {
                background-color: #ffffff;
                border: 1px solid #ddd;
                padding: 10px 15px;
                margin: 8px 0;
                border-radius: 5px;
                transition: all 0.3s ease;
            }
            .suggestion-list li:hover {
                background-color: #e0f7fa;
                border-color: #00bcd4;
            }
            .no-suggestions {
                text-align: center;
                color: #999;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Kết Quả</h1>
                <div class="user-name">Xin chào, ${score.userName}!</div>
            </div>

            <div class="results-container">
                <div class="results-intro">
                    <h2>Kết quả bài kiểm tra của bạn</h2>
                    <p>Dưới đây là điểm số của bạn ở từng nhóm sở thích nghề nghiệp:</p>
                </div>

                <div class="scores-grid">
                    <div class="score-card realistic">
                        <div class="score-header">
                            <div class="score-title">🔧 Realistic</div>
                            <div class="score-value">${score.realistic}</div>
                        </div>
                        <div class="score-bar">
                            <div class="score-fill realistic" style="width: ${score.realistic * 4}%"></div>
                        </div>
                        <div class="score-description">
                            Thích làm việc với tay, máy móc, công cụ. Ưa thích những công việc thực tế, cụ thể.
                        </div>
                    </div>

                    <div class="score-card investigative">
                        <div class="score-header">
                            <div class="score-title">🔬 Investigative</div>
                            <div class="score-value">${score.investigative}</div>
                        </div>
                        <div class="score-bar">
                            <div class="score-fill investigative" style="width: ${score.investigative * 4}%"></div>
                        </div>
                        <div class="score-description">
                            Thích nghiên cứu, phân tích, giải quyết vấn đề. Ưa thích tư duy logic và khoa học.
                        </div>
                    </div>

                    <div class="score-card artistic">
                        <div class="score-header">
                            <div class="score-title">🎨 Artistic</div>
                            <div class="score-value">${score.artistic}</div>
                        </div>
                        <div class="score-bar">
                            <div class="score-fill artistic" style="width: ${score.artistic * 4}%"></div>
                        </div>
                        <div class="score-description">
                            Thích sáng tạo, thể hiện bản thân. Ưa thích nghệ thuật, âm nhạc, văn học.
                        </div>
                    </div>

                    <div class="score-card social">
                        <div class="score-header">
                            <div class="score-title">👥 Social</div>
                            <div class="score-value">${score.social}</div>
                        </div>
                        <div class="score-bar">
                            <div class="score-fill social" style="width: ${score.social * 4}%"></div>
                        </div>
                        <div class="score-description">
                            Thích giúp đỡ, dạy dỗ người khác. Ưa thích làm việc với con người.
                        </div>
                    </div>

                    <div class="score-card enterprising">
                        <div class="score-header">
                            <div class="score-title">💼 Enterprising</div>
                            <div class="score-value">${score.enterprising}</div>
                        </div>
                        <div class="score-bar">
                            <div class="score-fill enterprising" style="width: ${score.enterprising * 4}%"></div>
                        </div>
                        <div class="score-description">
                            Thích lãnh đạo, thuyết phục. Ưa thích kinh doanh, bán hàng, quản lý.
                        </div>
                    </div>

                    <div class="score-card conventional">
                        <div class="score-header">
                            <div class="score-title">📊 Conventional</div>
                            <div class="score-value">${score.conventional}</div>
                        </div>
                        <div class="score-bar">
                            <div class="score-fill conventional" style="width: ${score.conventional * 4}%"></div>
                        </div>
                        <div class="score-description">
                            Thích trật tự, quy tắc. Ưa thích công việc văn phòng, kế toán, quản lý dữ liệu.
                        </div>
                    </div>
                </div>

                <div class="holland-code">
                    <h3>🏆 Holland Code của bạn</h3>
                    <div class="code-display">${score.hollandCode}</div>
                </div>

                <div class="careers-section">
                    <h3>💼 Nghề nghiệp phù hợp với bạn</h3>
                    <div class="careers-grid">
                        <c:forEach items="${careers}" var="career">
                            <div class="career-card">
                                <div class="career-title">${career.careerName}</div>
                                <div class="career-type">${career.primaryType}${career.secondaryType}</div>
                                <div class="career-description">${career.description}</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- AI Career Suggestions Section -->
                <div class="ai-suggestions-section">
                    <div class="ai-header">
                        <span class="ai-icon">🤖</span>
                        <h3>Gợi ý nghề nghiệp từ AI</h3>
                    </div>

                    <button id="generateAISuggestions" class="ai-generate-btn">
                        ✨ Tạo gợi ý từ AI
                    </button>

                    <div class="suggestion-container">
                        <h2>Gợi ý nghề nghiệp từ AI</h2>

                        <%
                            List<?> suggestions = (List<?>) session.getAttribute("aiCareerSuggestions");
                            if (suggestions != null && !suggestions.isEmpty()) {
                        %>
                        <ul class="suggestion-list">
                            <%
                                for (Object obj : suggestions) {
                            %>
                            <li><%= obj.toString()%></li>
                                <%
                                    }
                                %>
                        </ul>
                        <%
                        } else {
                        %>
                        <p class="no-suggestions">Không có gợi ý nghề nghiệp nào.</p>
                        <%
                            }
                        %>
                    </div>
                    <div id="loadingSpinner" class="loading-spinner hidden">
                        <div class="spinner"></div>
                        <span>AI đang phân tích kết quả của bạn...</span>
                    </div>

                    <div id="errorMessage" class="error-message hidden">
                        Có lỗi xảy ra khi tạo gợi ý. Vui lòng thử lại!
                    </div>

                    <div id="aiSuggestionsContainer" class="ai-cards-grid hidden">
                        <!-- AI suggestions will be populated here -->
                    </div>
                </div>

                <div class="actions">
                    <a href="riasec-test" class="btn btn-secondary">🔄 Làm lại test</a>
                    <a href="#" onclick="window.print()" class="btn btn-primary">🖨️ In kết quả</a>
                </div>
            </div>
        </div>

        <script>
            // Existing animation code
            window.addEventListener('load', function () {
                const scoreFills = document.querySelectorAll('.score-fill');
                scoreFills.forEach(fill => {
                    const width = fill.style.width;
                    fill.style.width = '0%';
                    setTimeout(() => {
                        fill.style.width = width;
                    }, 500);
                });
            });

            // AI Suggestions functionality
            document.getElementById('generateAISuggestions').addEventListener('click', function () {
                generateAISuggestions();
            });

            function generateAISuggestions() {
                const button = document.getElementById('generateAISuggestions');
                const loading = document.getElementById('loadingSpinner');
                const errorMessage = document.getElementById('errorMessage');
                const container = document.getElementById('aiSuggestionsContainer');

                // Hide previous results and show loading
                button.style.display = 'none';
                errorMessage.classList.add('hidden');
                container.classList.add('hidden');
                loading.classList.remove('hidden');

                // Call the AI API
                fetch('/FinalPJ/api/ai-careers', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'majors=' + encodeURIComponent(generateMajorsFromHollandCode())
                })
                        .then(response => response.json())
                        .then(data => {
                            loading.classList.add('hidden');

                            if (data.error) {
                                showError(data.error);
                            } else {
                                displayAISuggestions(data);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            loading.classList.add('hidden');
                            showError('Không thể kết nối đến dịch vụ AI. Vui lòng thử lại!');
                        });
            }

            function showError(message) {
                const errorElement = document.getElementById('errorMessage');
                const button = document.getElementById('generateAISuggestions');

                errorElement.textContent = message;
                errorElement.classList.remove('hidden');
                button.style.display = 'block';
            }

            function displayAISuggestions(suggestions) {
                const container = document.getElementById('aiSuggestionsContainer');
                container.innerHTML = '';

                suggestions.forEach(suggestion => {
                    const card = document.createElement('div');
                    card.className = 'ai-career-card';
                    card.innerHTML = `
                        <div class="ai-career-title">${suggestion.carrie || 'Không xác định'}</div>
                        <div class="ai-career-payment">${suggestion.paidment || 'Đang cập nhật'}</div>
                        <div class="ai-career-future">${suggestion.futureNote || 'Không có thông tin'}</div>
                    `;
                    container.appendChild(card);
                });

                container.classList.remove('hidden');
            }

            function generateMajorsFromHollandCode() {
                // Get Holland code from the page
                const hollandCodeElement = document.querySelector('.code-display');
                const hollandCode = hollandCodeElement ? hollandCodeElement.textContent : '';

                // Map Holland code to relevant majors (customize as needed)
                const codeMapping = {
                    'R': 'Kỹ thuật, Cơ khí, Xây dựng',
                    'I': 'Khoa học, Nghiên cứu, Y học',
                    'A': 'Nghệ thuật, Thiết kế, Văn học',
                    'S': 'Giáo dục, Y tế, Tâm lý học',
                    'E': 'Kinh doanh, Quản lý, Marketing',
                    'C': 'Kế toán, Tài chính, Quản trị'
                };

                let majors = [];
                for (let char of hollandCode) {
                    if (codeMapping[char]) {
                        majors.push(codeMapping[char]);
                    }
                }

                return majors.length > 0 ? majors.join(', ') : 'Các ngành phổ biến';
            }

            // Check if AI suggestions already exist on page load
            window.addEventListener('load', function () {
                fetch('/api/ai-careers', {
                    method: 'GET'
                })
                        .then(response => response.json())
                        .then(data => {
                            if (data && data.length > 0) {
                                document.getElementById('generateAISuggestions').style.display = 'none';
                                displayAISuggestions(data);
                            }
                        })
                        .catch(error => {
                            console.log('No existing AI suggestions found');
                        });
            });
        </script>
    </body>
</html>
