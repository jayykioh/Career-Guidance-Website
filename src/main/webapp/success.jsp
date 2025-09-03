<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh toán thành công</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', sans-serif;
                background: linear-gradient(135deg, #890C25, #5A0818);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .success-container {
                max-width: 600px;
                width: 100%;
                background: rgba(255, 255, 255, 0.98);
                backdrop-filter: blur(20px);
                border-radius: 24px;
                box-shadow: 0 30px 80px rgba(0, 0, 0, 0.15);
                padding: 50px 40px;
                text-align: center;
                position: relative;
                overflow: hidden;
            }

            .success-container::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #4CAF50, #45a049, #66bb6a);
                border-radius: 24px 24px 0 0;
            }

            .success-icon {
                width: 100px;
                height: 100px;
                margin: 0 auto 30px;
                background: linear-gradient(135deg, #890C25, #5A0818);
                box-shadow: 0 10px 30px rgba(137, 12, 37, 0.3);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                animation: checkmarkBounce 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);

            }

            @keyframes checkmarkBounce {
                0% {
                    transform: scale(0);
                    opacity: 0;
                }
                50% {
                    transform: scale(1.2);
                }
                100% {
                    transform: scale(1);
                    opacity: 1;
                }
            }

            .checkmark {
                width: 40px;
                height: 40px;
                stroke: white;
                stroke-width: 3;
                fill: none;
                animation: drawCheckmark 0.8s ease-out 0.2s forwards;
                stroke-dasharray: 100;
                stroke-dashoffset: 100;
            }

            @keyframes drawCheckmark {
                to {
                    stroke-dashoffset: 0;
                }
            }

            .success-title {
                font-size: 2.5rem;
                font-weight: 800;
                color: #2c3e50;
                margin-bottom: 15px;
                background: linear-gradient(135deg, #890C25, #5A0818);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .success-message {
                font-size: 1.2rem;
                color: #555;
                margin-bottom: 40px;
                line-height: 1.6;
            }

            .success-details {

                border-radius: 16px;
                padding: 30px;
                margin: 30px 0;
                border-left: 4px solid #4CAF50;
            }

            .detail-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
                padding: 10px 0;
            }

            .detail-row:last-child {
                margin-bottom: 0;
                border-top: 1px solid #dee2e6;
                padding-top: 20px;
                margin-top: 20px;
            }

            .detail-label {
                font-weight: 600;
                color: #6c757d;
                font-size: 0.95rem;
            }

            .detail-value {
                font-weight: 700;
                color: #2c3e50;
                font-size: 1rem;
            }

            .premium-badge {
                background: linear-gradient(135deg, #FFB100, #FFA000);
                box-shadow: 0 4px 15px rgba(255, 179, 0, 0.3);
                color: white;
                padding: 8px 16px;
                border-radius: 20px;
                font-size: 0.9rem;
                font-weight: 600;
                display: inline-flex;
                align-items: center;
                gap: 5px;
              
            }

            .membership-info {
                background: linear-gradient(135deg, #890C25, #5A0818);
                color: white;
                border-radius: 16px;
                padding: 25px;
                margin: 30px 0;
                position: relative;
                overflow: hidden;
            }

            .membership-info::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
                animation: shine 2s infinite;
            }

            @keyframes shine {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .membership-title {
                font-size: 1.3rem;
                font-weight: 700;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .membership-description {
                font-size: 1rem;
                opacity: 0.9;
                line-height: 1.5;
            }

            .action-buttons {
                display: flex;
                gap: 15px;
                justify-content: center;
                flex-wrap: wrap;
                margin-top: 40px;
            }

            .btn {
                padding: 15px 30px;
                border: none;
                border-radius: 12px;
                font-weight: 600;
                font-size: 1rem;
                text-decoration: none;
                transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                position: relative;
                overflow: hidden;
            }

            .btn-primary {
             background: linear-gradient(135deg, #890C25, #5A0818);
box-shadow: 0 8px 25px rgba(137, 12, 37, 0.3);
color: white;
            }

            .btn-secondary {
                background: white;
                color: #6c757d;
                border: 2px solid #e9ecef;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }

            .btn:hover {
                transform: translateY(-2px);
            }

            .btn-primary:hover {
                box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
            }

            .btn-secondary:hover {
                border-color: #667eea;
                color: #667eea;
            }

            .floating-elements {
                position: absolute;
                top: 20px;
                right: 20px;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .floating-icon {
                width: 30px;
                height: 30px;
                background: linear-gradient(135deg, rgba(76, 175, 80, 0.2), rgba(76, 175, 80, 0.1));
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 14px;
                animation: float 3s ease-in-out infinite;
                backdrop-filter: blur(10px);
            }

            .floating-icon:nth-child(2) {
                animation-delay: 1s;
            }
            .floating-icon:nth-child(3) {
                animation-delay: 2s;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0px);
                }
                50% {
                    transform: translateY(-5px);
                }
            }

            @media (max-width: 768px) {
                .success-container {
                    padding: 40px 25px;
                    margin: 10px;
                }

                .success-title {
                    font-size: 2rem;
                }

                .action-buttons {
                    flex-direction: column;
                    align-items: center;
                }

                .btn {
                    width: 100%;
                    justify-content: center;
                }

                .detail-row {
                    flex-direction: column;
                    gap: 5px;
                    align-items: flex-start;
                }
            }
        </style>
    </head>
    <body>
        <div class="success-container">
            <div class="floating-elements">
                <div class="floating-icon">🎉</div>
                <div class="floating-icon">⭐</div>
                <div class="floating-icon">🚀</div>
            </div>

            <div class="success-icon">
                <svg class="checkmark" viewBox="0 0 52 52">
                <path d="M14 27l8 8L38 19" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>

            <h1 class="success-title">Thanh toán thành công!</h1>
            <p class="success-message">
                Gói Premium đã được kích hoạt thành công. Bạn có thể sử dụng tất cả tính năng cao cấp ngay bây giờ!
            </p>

            <div class="success-details">
                <div class="detail-row">
                    <span class="detail-label">Gói dịch vụ:</span>
                    <span class="detail-value">
                        <span class="premium-badge">
                            Premium Package
                        </span>
                    </span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Số tiền:</span>
                    <span class="detail-value">
                        <%= session.getAttribute("amount") != null ? session.getAttribute("amount") : "50,000 VND"%>
                    </span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Mã giao dịch:</span>
                    <span class="detail-value">
                        <%= session.getAttribute("transactionId") != null ? session.getAttribute("transactionId") : "N/A"%>
                    </span>
                </div>
                <% if (session.getAttribute("transactionNo") != null) {%>
                <div class="detail-row">
                    <span class="detail-label">Mã VNPay:</span>
                    <span class="detail-value"><%= session.getAttribute("transactionNo")%></span>
                </div>
                <% } %>
                <% if (session.getAttribute("bankCode") != null) {%>
                <div class="detail-row">
                    <span class="detail-label">Ngân hàng:</span>
                    <span class="detail-value"><%= session.getAttribute("bankCode")%></span>
                </div>
                <% }%>
                <div class="detail-row">
                    <span class="detail-label">Thời gian:</span>
                    <span class="detail-value">
                        <%= java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss - dd/MM/yyyy"))%>
                    </span>
                </div>
            </div>

            <div class="membership-info">
                <div class="membership-title">
                    🎯Premium Membership Activated
                </div>
                <div class="membership-description">
                    <%
                        Model.User currentUser = (Model.User) session.getAttribute("currentUser");
                        if (currentUser != null && currentUser.getMembershipExpiry() != null) {
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                            String expiryDate = currentUser.getMembershipExpiry().format(formatter);
                    %>
                    Thành viên Premium của bạn sẽ có hiệu lực đến <strong><%= expiryDate%></strong>.
                    Bạn có thể truy cập tất cả tính năng cao cấp bao gồm: bài test chuyên sâu, gợi ý nguyện vọng không giới hạn, 
                    và báo cáo phân tích chi tiết.
                    <%
                    } else {
                    %>
                    Thành viên Premium của bạn có thời hạn 30 ngày. Truy cập tất cả tính năng cao cấp ngay bây giờ!
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/landingpage.jsp" class="btn btn-primary">
                    Về Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/riasec-test" class="btn btn-primary">
                    Làm bài test Premium
                </a>
                <a href="${pageContext.request.contextPath}/profile" class="btn btn-secondary">
                    Xem hồ sơ
                </a>
            </div>

            <%
                // Clear payment-related session attributes to avoid showing old data
                session.removeAttribute("paymentSuccess");
                session.removeAttribute("transactionId");
                session.removeAttribute("transactionNo");
                session.removeAttribute("bankCode");
                session.removeAttribute("amount");
                session.removeAttribute("paymentMethod");
            %>
        </div>

        <script>
            // Add some interactive effects
            document.addEventListener('DOMContentLoaded', function () {
                // Animate detail rows
                const detailRows = document.querySelectorAll('.detail-row');
                detailRows.forEach((row, index) => {
                    setTimeout(() => {
                        row.style.opacity = '0';
                        row.style.transform = 'translateY(20px)';
                        row.style.transition = 'all 0.6s ease';

                        setTimeout(() => {
                            row.style.opacity = '1';
                            row.style.transform = 'translateY(0)';
                        }, 100);
                    }, index * 100);
                });

                // Add click effects to buttons
                const buttons = document.querySelectorAll('.btn');
                buttons.forEach(button => {
                    button.addEventListener('click', function (e) {
                        const ripple = document.createElement('div');
                        const rect = button.getBoundingClientRect();
                        const size = Math.max(rect.width, rect.height);
                        const x = e.clientX - rect.left - size / 2;
                        const y = e.clientY - rect.top - size / 2;

                        ripple.style.cssText = `
                            position: absolute;
                            width: ${size}px;
                            height: ${size}px;
                            left: ${x}px;
                            top: ${y}px;
                            background: rgba(255, 255, 255, 0.3);
                            border-radius: 50%;
                            transform: scale(0);
                            animation: ripple 0.6s ease-out;
                            pointer-events: none;
                        `;

                        button.style.position = 'relative';
                        button.style.overflow = 'hidden';
                        button.appendChild(ripple);

                        setTimeout(() => ripple.remove(), 600);
                    });
                });
            });

            // Add ripple animation
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(2);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        </script>
    </body>
</html>