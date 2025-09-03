<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi thanh toán</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        /* Animated background elements */
        .bg-particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .particle:nth-child(1) { width: 60px; height: 60px; top: 20%; left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { width: 40px; height: 40px; top: 60%; left: 80%; animation-delay: 2s; }
        .particle:nth-child(3) { width: 80px; height: 80px; top: 80%; left: 20%; animation-delay: 4s; }
        .particle:nth-child(4) { width: 30px; height: 30px; top: 30%; left: 70%; animation-delay: 1s; }
        .particle:nth-child(5) { width: 50px; height: 50px; top: 10%; left: 60%; animation-delay: 3s; }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 0.3; }
            50% { transform: translateY(-20px) rotate(180deg); opacity: 0.6; }
        }

        .error-container {
            max-width: 550px;
            width: 100%;
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.15);
            padding: 50px 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
            z-index: 10;
        }

        .error-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #ef4444, #dc2626, #b91c1c);
            border-radius: 24px 24px 0 0;
        }

        .error-icon {
            width: 100px;
            height: 100px;
            margin: 0 auto 30px;
            background: linear-gradient(135deg, #ef4444, #dc2626);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: errorPulse 2s ease-in-out infinite;
            box-shadow: 0 10px 30px rgba(239, 68, 68, 0.3);
            position: relative;
        }

        @keyframes errorPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .error-icon::before {
            content: '';
            position: absolute;
            inset: -10px;
            border: 2px solid rgba(239, 68, 68, 0.3);
            border-radius: 50%;
            animation: ripple 2s ease-out infinite;
        }

        @keyframes ripple {
            0% { transform: scale(0.8); opacity: 1; }
            100% { transform: scale(1.5); opacity: 0; }
        }

        .error-x {
            width: 40px;
            height: 40px;
            stroke: white;
            stroke-width: 4;
            fill: none;
            animation: drawX 1s ease-out 0.3s forwards;
            stroke-dasharray: 100;
            stroke-dashoffset: 100;
        }

        @keyframes drawX {
            to { stroke-dashoffset: 0; }
        }

        .error-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: #dc2626;
            margin-bottom: 15px;
            background: linear-gradient(135deg, #dc2626, #ef4444);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .error-message {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .error-details {
            background: linear-gradient(135deg, #fef2f2, #fee2e2);
            border-radius: 16px;
            padding: 25px;
            margin: 25px 0;
            border-left: 4px solid #ef4444;
            text-align: left;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            padding: 8px 0;
        }

        .detail-row:last-child {
            margin-bottom: 0;
            border-top: 1px solid #fecaca;
            padding-top: 15px;
            margin-top: 15px;
        }

        .detail-label {
            font-weight: 600;
            color: #7f1d1d;
            font-size: 0.9rem;
        }

        .detail-value {
            font-weight: 700;
            color: #dc2626;
            font-size: 0.95rem;
            text-align: right;
        }

        .error-code {
            background: #dc2626;
            color: white;
            padding: 6px 12px;
            border-radius: 8px;
            font-family: monospace;
            font-size: 0.9rem;
        }

        .help-section {
            background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
            border-radius: 16px;
            padding: 25px;
            margin: 25px 0;
            border-left: 4px solid #0ea5e9;
        }

        .help-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #0c4a6e;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .help-list {
            list-style: none;
            text-align: left;
            color: #0369a1;
        }

        .help-list li {
            margin-bottom: 8px;
            display: flex;
            align-items: flex-start;
            gap: 8px;
        }

        .help-list li::before {
            content: "💡";
            font-size: 0.9rem;
            margin-top: 2px;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 35px;
        }

        .btn {
            padding: 15px 25px;
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
            min-width: 140px;
            justify-content: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, #dc2626, #b91c1c);
            color: white;
            box-shadow: 0 8px 25px rgba(220, 38, 38, 0.3);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6b7280, #4b5563);
            color: white;
            box-shadow: 0 8px 25px rgba(107, 114, 128, 0.3);
        }

        .btn-outline {
            background: white;
            color: #6b7280;
            border: 2px solid #e5e7eb;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .btn-primary:hover {
            box-shadow: 0 15px 35px rgba(220, 38, 38, 0.4);
        }

        .btn-secondary:hover {
            box-shadow: 0 15px 35px rgba(107, 114, 128, 0.4);
        }

        .btn-outline:hover {
            border-color: #dc2626;
            color: #dc2626;
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
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.2), rgba(239, 68, 68, 0.1));
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            animation: floatIcon 3s ease-in-out infinite;
            backdrop-filter: blur(10px);
        }

        .floating-icon:nth-child(2) { animation-delay: 1s; }
        .floating-icon:nth-child(3) { animation-delay: 2s; }

        @keyframes floatIcon {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
        }

        .support-info {
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 0.9rem;
        }

        .support-contact {
            background: linear-gradient(135deg, #f9fafb, #f3f4f6);
            border-radius: 12px;
            padding: 20px;
            margin-top: 15px;
            border: 1px solid #e5e7eb;
        }

        .support-contact h4 {
            color: #374151;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .support-contact p {
            color: #6b7280;
            line-height: 1.5;
        }

        .support-link {
            color: #dc2626;
            text-decoration: none;
            font-weight: 600;
        }

        .support-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .error-container {
                padding: 40px 25px;
                margin: 10px;
            }

            .error-title {
                font-size: 2rem;
            }

            .action-buttons {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 100%;
                max-width: 300px;
            }

            .detail-row {
                flex-direction: column;
                gap: 5px;
                align-items: flex-start;
            }

            .detail-value {
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <!-- Animated Background Particles -->
    <div class="bg-particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <div class="error-container">
        <div class="floating-elements">
            <div class="floating-icon">⚠️</div>
            <div class="floating-icon">💳</div>
            <div class="floating-icon">❌</div>
        </div>

        <div class="error-icon">
            <svg class="error-x" viewBox="0 0 52 52">
                <path d="M16 16L36 36M36 16L16 36" stroke-linecap="round"/>
            </svg>
        </div>

        <h1 class="error-title">Thanh toán thất bại!</h1>
        <p class="error-message">
            Rất tiếc, giao dịch của bạn không thể hoàn tất. Vui lòng kiểm tra thông tin và thử lại.
        </p>

        <div class="error-details">
            <div class="detail-row">
                <span class="detail-label">Trạng thái:</span>
                <span class="detail-value">Thất bại</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Gói dịch vụ:</span>
                <span class="detail-value">Premium Package</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Số tiền:</span>
                <span class="detail-value">50,000 VND</span>
            </div>
            <% if (session.getAttribute("paymentError") != null) { %>
            <div class="detail-row">
                <span class="detail-label">Lý do:</span>
                <span class="detail-value"><%= session.getAttribute("paymentError") %></span>
            </div>
            <% } %>
            <div class="detail-row">
                <span class="detail-label">Mã lỗi:</span>
                <span class="detail-value">
                    <span class="error-code">
                        <%= request.getParameter("code") != null ? request.getParameter("code") : "PAYMENT_FAILED" %>
                    </span>
                </span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Thời gian:</span>
                <span class="detail-value">
                    <%= LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss - dd/MM/yyyy")) %>
                </span>
            </div>
        </div>

        <div class="help-section">
            <div class="help-title">
                🔧 Cách khắc phục
            </div>
            <ul class="help-list">
                <li>Kiểm tra số dư tài khoản ngân hàng</li>
                <li>Đảm bảo thông tin thẻ chính xác</li>
                <li>Thử lại với phương thức thanh toán khác</li>
                <li>Kiểm tra kết nối internet ổn định</li>
                <li>Liên hệ ngân hàng nếu thẻ bị khóa</li>
            </ul>
        </div>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/create-payment" class="btn btn-primary">
                🔄 Thử lại thanh toán
            </a>
            <a href="${pageContext.request.contextPath}/profile" class="btn btn-secondary">
                👤 Xem hồ sơ
            </a>
            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline">
                🏠 Về trang chủ
            </a>
        </div>

        <div class="support-info">
            <div class="support-contact">
                <h4>Cần hỗ trợ?</h4>
                <p>
                    Nếu vấn đề vẫn tiếp tục, vui lòng liên hệ với chúng tôi qua: <br>
                    Email: <a href="mailto:support@yoursite.com" class="support-link">support@yoursite.com</a><br>
                    Hotline: <a href="tel:1900xxx" class="support-link">1900 XXX XXX</a><br>
                    <small>Thời gian hỗ trợ: 8:00 - 22:00 (Tất cả các ngày)</small>
                </p>
            </div>
        </div>

        <% 
            // Clear error message to avoid showing old data on refresh
            session.removeAttribute("paymentError");
        %>
    </div>

    <script>
        // Add interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            // Animate error details
            const detailRows = document.querySelectorAll('.detail-row');
            detailRows.forEach((row, index) => {
                setTimeout(() => {
                    row.style.opacity = '0';
                    row.style.transform = 'translateX(-20px)';
                    row.style.transition = 'all 0.6s ease';
                    
                    setTimeout(() => {
                        row.style.opacity = '1';
                        row.style.transform = 'translateX(0)';
                    }, 100);
                }, index * 100);
            });

            // Add click effects to buttons
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
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

            // Auto-focus on retry button after 2 seconds
            setTimeout(() => {
                const retryButton = document.querySelector('.btn-primary');
                if (retryButton) {
                    retryButton.style.transform = 'scale(1.05)';
                    setTimeout(() => {
                        retryButton.style.transform = '';
                    }, 500);
                }
            }, 2000);
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