<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RIASEC Career Interest Test</title>
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
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .back-btn-fixed {
                position: fixed;
                top: 20px;
                left: 20px;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background: #993333;
                color: #ffffff;
                text-decoration: none;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                z-index: 999;
            }

            .back-btn-fixed:hover {
                background: #B34747;
                transform: scale(1.1);
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            }

            .container {
                width: 100%;
                max-width: 800px;
                background: white;
                border-radius: 40px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.2);
                overflow: hidden;
                padding-bottom: 40px;
                transform: translate(19px, -19px);
            }

            .header {
                background: linear-gradient(45deg, #800000, #CC4E5C);
                color: white;
                padding: 30px;
                text-align: center;
                border-top-left-radius: 40px;
                border-top-right-radius: 40px;
            }

            .header h1 {
                font-size: 2.5em;
                margin-bottom: 10px;
            }

            .header p {
                font-size: 1.1em;
                opacity: 0.9;
            }

            .form-container {
                padding: 30px;
            }

            .user-info {
                margin-bottom: 30px;
                padding: 20px;
                background: #f8f9fa;
                border-radius: 10px;
            }

            .user-info label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: #333;
            }

            .user-info input {
                width: 100%;
                padding: 12px;
                border: 2px solid #e9ecef;
                border-radius: 8px;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            .user-info input:focus {
                outline: none;
                border-color: #CC4E5C;
            }

            .progress-bar {
                height: 6px;
                background: #e9ecef;
                border-radius: 3px;
                margin: 20px 0;
                overflow: hidden;
            }

            .progress {
                height: 100%;
                background: linear-gradient(45deg, #CC4E5C, #E06666);
                border-radius: 3px;
                transition: width 0.3s;
            }

            .question-group {
                margin-bottom: 25px;
                padding: 20px;
                border: 2px solid #e9ecef;
                border-radius: 10px;
                transition: all 0.3s;
            }

            .question-group:hover {
                border-color: #CC4E5C;
                box-shadow: 0 5px 15px rgba(204, 78, 92, 0.1);
            }

            .question-text {
                font-size: 1.1em;
                margin-bottom: 15px;
                color: #333;
                font-weight: 500;
            }

            .question-number {
                background: #800000;
                color: white;
                padding: 5px 10px;
                border-radius: 20px;
                font-size: 0.9em;
                margin-right: 10px;
            }

            .radio-group-grid {
                display: grid;
                grid-template-columns: repeat(5, 1fr);
                gap: 10px;
                margin-top: 10px;
                text-align: center;
            }

            .radio-item-grid {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .scale-label {
                font-size: 0.8em;
                color: #666;
                margin-bottom: 5px;
                min-height: 28px;
                font-weight: 600; /* chữ đậm hơn */
            }

            .radio-item-grid input[type="radio"] {
                width: 20px;
                height: 20px;
                margin-bottom: 4px;
                cursor: pointer;
                accent-color: #CC4E5C;
            }

            .radio-value {
                font-size: 0.8em;
                color: #999;
            }

            .submit-section {
                text-align: center;
                margin-top: 40px;
                padding: 30px;
                background: #f8f9fa;
                border-radius: 10px;
            }

            .submit-btn {
                background: linear-gradient(45deg, #800000, #CC4E5C);
                color: white;
                padding: 15px 40px;
                border: none;
                border-radius: 25px;
                font-size: 1.2em;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            }

            .submit-btn:hover {
                background: linear-gradient(45deg, #CC4E5C, #E06666);
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
            }
        </style>
    </head>
    <body>

        <a href="${pageContext.request.contextPath}/dashboard/test_content.jsp" class="back-btn-fixed">
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </a>

        <div class="container">
            <div class="header">
                <h1>Bài kiểm tra nguyện vọng</h1>
                <p>Khám phá sở thích nghề nghiệp của bạn thông qua bài kiểm tra này</p>
            </div>

            <div class="form-container">
                <form action="riasec-test" method="post" id="riasecForm">
                    <div class="user-info">
                        <label for="userName">Họ và tên:</label>
                        <input type="text" id="userName" name="userName" required placeholder="Nhập họ và tên của bạn">
                    </div>

                    <div class="progress-bar">
                        <div class="progress" id="progressBar" style="width: 0%"></div>
                    </div>

                    <c:forEach items="${questions}" var="question" varStatus="status">
                        <div class="question-group">
                            <div class="question-text">
                                <span class="question-number">${status.index + 1}</span>
                                ${question.questionText}
                            </div>

                            <div class="rating-scale">
                                <div class="radio-group-grid">
                                    <c:set var="scaleLabels" value="Hoàn toàn không thích,Không thích,Trung bình,Thích,Rất thích"/>
                                    <c:forEach begin="1" end="5" var="i">
                                        <div class="radio-item-grid">
                                            <label for="q${question.id}_${i}" class="scale-label">
                                                ${fn:split(scaleLabels, ',')[i-1]}
                                            </label>
                                            <input type="radio" id="q${question.id}_${i}" name="q${question.id}" value="${i}" <c:if test="${i==1}">checked required</c:if> />
                                            <div class="radio-value">${i}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="submit-section">
                        <button type="submit" class="submit-btn">
                            Xem Kết Quả
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            const form = document.getElementById('riasecForm');
            const progressBar = document.getElementById('progressBar');
            const totalQuestions = ${questions.size()};

            function updateProgress() {
                const answered = new Set();
                form.querySelectorAll('input[type="radio"]:checked').forEach(input => {
                    answered.add(input.name);
                });
                const progress = (answered.size / totalQuestions) * 100;
                progressBar.style.width = progress + '%';
            }

            form.addEventListener('change', updateProgress);

            document.querySelectorAll('.question-group').forEach(group => {
                group.addEventListener('click', function () {
                    this.style.borderColor = '#F28C8C';
                    setTimeout(() => {
                        this.style.borderColor = '#e9ecef';
                    }, 2000);
                });
            });

            document.querySelectorAll('input[type="radio"]').forEach(radio => {
                radio.addEventListener('click', function (e) {
                    if (this.checked && this.dataset.waschecked === "true") {
                        this.checked = false;
                        this.dataset.waschecked = "false";
                        updateProgress(); // gọi cập nhật progress khi bỏ chọn
                    } else {
                        this.dataset.waschecked = "true";
                        document.querySelectorAll('input[name="' + this.name + '"]').forEach(r => {
                            if (r !== this)
                                r.dataset.waschecked = "false";
                        });
                        updateProgress(); // cập nhật khi chọn mới
                    }
                });
            });
        </script>

    </body>
</html>
