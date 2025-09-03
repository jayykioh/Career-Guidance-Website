<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Học Sinh Nói Gì Về Chúng Tôi</title>
        <style>



            /* Animated background particles */

            .particle:nth-child(1) {
                width: 80px;
                height: 80px;
                top: 10%;
                left: 10%;
                animation-delay: 1s;
            }
            .particle:nth-child(2) {
                width: 60px;
                height: 60px;
                top: 20%;
                left: 80%;
                animation-delay: 3s;
            }
            .particle:nth-child(3) {
                width: 120px;
                height: 120px;
                top: 60%;
                left: 5%;
                animation-delay: 3s;
            }
            .particle:nth-child(4) {
                width: 40px;
                height: 40px;
                top: 80%;
                left: 70%;
                animation-delay: 2s;
            }
            .particle:nth-child(5) {
                width: 100px;
                height: 100px;
                top: 30%;
                left: 60%;
                animation-delay: 3s;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0px) rotate(0deg);
                }
                50% {
                    transform: translateY(-20px) rotate(180deg);
                }
            }

            .testimonials-section {
                max-width: 1400px;
                margin: 0 auto;
                position: relative;
                z-index: 1;
            }

            .section-header {
                text-align: center;
                margin-bottom: 80px;
                opacity: 0;
                animation: slideUp 1s ease-out 0.5s forwards;
            }

            .section-title {
                font-size: clamp(2.5rem, 5vw, 4rem);
                font-weight: 800;
                background: linear-gradient(135deg, #fff, #f8f9fa);
                -webkit-background-clip: text;

                background-clip: text;
                margin-bottom: 20px;
                line-height: 1.1;
                text-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .section-subtitle {
                font-size: 1.2rem;
                color: rgba(255, 255, 255, 0.9);
                max-width: 650px;
                margin: 0 auto;
                font-weight: 400;
            }

            .testimonials-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
                gap: 40px;
                margin-bottom: 60px;
                perspective: 1000px;
            }

            .testimonial-card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 24px;
                padding: 40px;
                position: relative;
                transform-style: preserve-3d;
                transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
                opacity: 0;
                animation: cardFadeIn 1s ease-out forwards;
                box-shadow:
                    0 20px 40px rgba(0, 0, 0, 0.1),
                    0 0 0 1px rgba(255, 255, 255, 0.1);
            }

            .testimonial-card:nth-child(1) {
                animation-delay: 0.8s;
            }
            .testimonial-card:nth-child(2) {
                animation-delay: 1s;
            }
            .testimonial-card:nth-child(3) {
                animation-delay: 1.2s;
            }
            .testimonial-card:nth-child(4) {
                animation-delay: 1.4s;
            }

            .testimonial-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #ff6b6b, #4ecdc4, #45b7d1, #96ceb4);
                border-radius: 24px 24px 0 0;
            }

            .testimonial-card:hover {
                transform: translateY(-15px) rotateX(5deg) rotateY(5deg);
                box-shadow:
                    0 40px 80px rgba(0, 0, 0, 0.15),
                    0 0 0 1px rgba(255, 255, 255, 0.2);
            }

            .testimonial-header {
                display: flex;
                align-items: center;
                margin-bottom: 25px;
                position: relative;
            }





            .user-avatar {
                width: 70px;
                height: 70px;
                border-radius: 50%;
                object-fit: cover;
                margin-right: 20px;
                border: 4px solid transparent;
                background-color:    #800000;
                padding: 2px;
                transition: all 0.3s ease;
            }






            .user-avatar img {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                object-fit: cover;
            }

            .testimonial-card:hover .user-avatar {
                transform: scale(1.1) rotate(5deg);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }

            .user-info h4 {
                font-size: 1.3rem;
                font-weight: 700;
                color: #2c3e50;
                margin-bottom: 8px;
                background: linear-gradient(135deg, #2c3e50, #3498db);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .user-info p {
                color: #7f8c8d;
                font-size: 0.95rem;
                font-weight: 500;
            }

            .stars-container {
                display: flex;
                align-items: center;
                gap: 8px;
                margin-bottom: 20px;
            }

            .stars {
                display: flex;
                gap: 2px;
            }

            .star {
                color: #ffd700;
                font-size: 1.4rem;
                text-shadow: 0 2px 4px rgba(255, 215, 0, 0.3);
                transition: all 0.3s ease;
                animation: sparkle 2s ease-in-out infinite;
                animation-delay: calc(var(--i) * 0.2s);
            }

            .testimonial-card:hover .star {
                transform: scale(1.2);
            }

            @keyframes sparkle {
                0%, 100% {
                    opacity: 1;
                }
                50% {
                    opacity: 0.7;
                    transform: scale(0.95);
                }
            }

            .rating-text {
                color: #666;
                font-size: 0.9rem;
                font-weight: 500;
                margin-left: 10px;
            }

            .testimonial-title {
                font-size: 1.25rem;
                font-weight: 700;
                color: #2c3e50;
                margin-bottom: 20px;
                line-height: 1.3;
                background: linear-gradient(135deg, #2c3e50, #34495e);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .testimonial-text {
                color: #555;
                font-size: 1rem;
                line-height: 1.7;
                font-weight: 400;
                position: relative;
            }

            .testimonial-text::before {
                content: '"';
                position: absolute;
                top: -10px;
                left: -15px;
                font-size: 4rem;
                color: rgba(102, 126, 234, 0.1);
                font-family: Georgia, serif;
                line-height: 1;
            }

            .floating-elements {
                position: absolute;
                top: 20px;
                right: 20px;
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .floating-icon {
                width: 40px;
                height: 40px;
                background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1));
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
                animation: floatIcon 3s ease-in-out infinite;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .floating-icon:nth-child(2) {
                animation-delay: 1s;
            }
            .floating-icon:nth-child(3) {
                animation-delay: 2s;
            }

            @keyframes floatIcon {
                0%, 100% {
                    transform: translateY(0px);
                }
                50% {
                    transform: translateY(-10px);
                }
            }

            .navigation-section {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 20px;
                margin: 60px 0;
            }

            .nav-dots {
                display: flex;
                gap: 12px;
            }

            .dot {
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.3);
                cursor: pointer;
                transition: all 0.4s cubic-bezier(0.23, 1, 0.320, 1);
                position: relative;
            }

            .dot::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 0;
                height: 0;
                background: linear-gradient(135deg, #667eea, #764ba2);
                border-radius: 50%;
                transition: all 0.4s ease;
            }

            .dot.active::before {
                width: 20px;
                height: 20px;
            }

            .dot.active {
                background: transparent;
            }

            .cta-section {
                text-align: center;
                padding: 60px 40px;
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border-radius: 32px;
                border: 1px solid rgba(255, 255, 255, 0.2);
                box-shadow: 0 30px 60px rgba(0, 0, 0, 0.1);
                position: relative;
                overflow: hidden;
                opacity: 0;
                animation: slideUp 1s ease-out 2s forwards;
            }

            .cta-section::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: conic-gradient(from 0deg, transparent, rgba(102, 126, 234, 0.1), transparent);
                animation: rotate 10s linear infinite;
                z-index: -1;
            }

            @keyframes rotate {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .cta-title {
                font-size: 2.2rem;
                font-weight: 800;
                background: linear-gradient(135deg, #800000, #3498db);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-bottom: 20px;
            }

            .cta-description {
                font-size: 1.1rem;
                color: #7f8c8d;
                margin-bottom: 35px;
                line-height: 1.6;
            }

            .cta-button {
       
                    display: inline-flex;
                    align-items: center;
                    gap: 12px;
                    padding: 18px 40px;
                    background: linear-gradient(135deg, #800000, #b22222);  /* Đổi thành màu đỏ đậm */
                    color: white;
                    text-decoration: none;
                    border-radius: 50px;
                    font-weight: 700;
                    font-size: 1.1rem;
                    transition: all 0.4s cubic-bezier(0.23, 1, 0.320, 1);
                    box-shadow: 0 10px 30px rgba(128, 0, 0, 0.4);  /* Đổi shadow thành màu đỏ */
                    position: relative;
                    overflow: hidden;
                
            }



            .cta-button:hover::before {
                left: 100%;
            }

            .cta-button:hover {
                .cta-button:hover {
                    transform: translateY(-3px) scale(1.05);
                    box-shadow: 0 20px 40px rgba(128, 0, 0, 0.5);  /* Đổi hover shadow thành màu đỏ */
                }
            }



            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translateY(50px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes cardFadeIn {
                from {
                    opacity: 0;
                    transform: translateY(30px) rotateX(-10deg);
                }
                to {
                    opacity: 1;
                    transform: translateY(0) rotateX(0deg);
                }
            }

            /* Mobile Responsiveness */
            @media (max-width: 768px) {
                body {
                    padding: 40px 15px;
                }

                .testimonials-container {
                    grid-template-columns: 1fr;
                    gap: 25px;
                }

                .testimonial-card {
                    padding: 30px 25px;
                    border-radius: 20px;
                }

                .section-title {
                    font-size: 2.5rem;
                }

                .cta-section {
                    padding: 40px 25px;
                    border-radius: 24px;
                }

                .cta-title {
                    font-size: 1.8rem;
                }

                .floating-elements {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <!-- Animated Background Particles -->


        <section class="testimonials-section">
            <div class="section-header">
                <h2 class="section-title">Học Sinh Nói Gì Về Chúng Tôi</h2>
                <p class="section-subtitle">
                    Hàng nghìn học sinh đã tìm được nguyện vọng phù hợp và trúng tuyển vào trường mơ ước qua platform của chúng tôi
                </p>
            </div>

            <div class="testimonials-container">
                <div class="testimonial-card">
                    <div class="floating-elements">
                        <div class="floating-icon">🎯</div>
                        <div class="floating-icon">💡</div>
                        <div class="floating-icon">⭐</div>
                    </div>
                    <div class="testimonial-header">
                        <div class="user-avatar">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face" alt="Minh Tuấn">
                        </div>
                        <div class="user-info">
                            <h4>Nguyễn Minh Tuấn</h4>
                            <p>Sinh viên K67 - ĐH Bách Khoa Hà Nội</p>
                        </div>
                    </div>
                    <div class="stars-container">
                        <div class="stars">
                            <span class="star" style="--i:0">★</span>
                            <span class="star" style="--i:1">★</span>
                            <span class="star" style="--i:2">★</span>
                            <span class="star" style="--i:3">★</span>
                            <span class="star" style="--i:4">★</span>
                        </div>
                        <span class="rating-text">5.0/5</span>
                    </div>
                    <h3 class="testimonial-title">Tìm được đam mê thực sự của mình</h3>
                    <p class="testimonial-text">
                        Bài test định hướng nghề nghiệp giúp tôi khám phá ra mình có năng khiếu với lập trình. 
                        Từ một người hoàn toàn mù mờ về tương lai, giờ tôi đã là sinh viên Công nghệ thông tin 
                        và rất yêu thích những gì mình đang học!
                    </p>
                </div>



                <div class="testimonial-card">
                    <div class="floating-elements">
                        <div class="floating-icon">🚀</div>
                        <div class="floating-icon">💎</div>
                        <div class="floating-icon">🎨</div>
                    </div>
                    <div class="testimonial-header">
                        <div class="user-avatar">
                            <img src="https://images.unsplash.com/photo-1507591064344-4c6ce005b128?w=150&h=150&fit=crop&crop=face" alt="Đức Anh">
                        </div>
                        <div class="user-info">
                            <h4>Trần Đức Anh</h4>
                            <p>Sinh viên K67 - ĐH Kinh tế Quốc Dân</p>
                        </div>
                    </div>
                    <div class="stars-container">
                        <div class="stars">
                            <span class="star" style="--i:0">★</span>
                            <span class="star" style="--i:1">★</span>
                            <span class="star" style="--i:2">★</span>
                            <span class="star" style="--i:3">★</span>
                            <span class="star" style="--i:4">★</span>
                        </div>
                        <span class="rating-text">5.0/5</span>
                    </div>
                    <h3 class="testimonial-title">Giao diện hiện đại, trải nghiệm tuyệt vời</h3>
                    <p class="testimonial-text">
                        UI/UX của website thật sự ấn tượng và dễ sử dụng. Mọi thông tin được trình bày rõ ràng, 
                        bài test thú vị không hề nhàm chán. Tôi đã giới thiệu cho nhiều bạn bè và ai cũng khen ngợi. 
                        Đây chính là platform mà GenZ chúng mình cần!
                    </p>
                </div>

                <div class="testimonial-card">
                    <div class="floating-elements">
                        <div class="floating-icon">🌟</div>
                        <div class="floating-icon">📱</div>
                        <div class="floating-icon">💪</div>
                    </div>
                    <div class="testimonial-header">
                        <div class="user-avatar">
                            <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face" alt="Phương Anh">
                        </div>
                        <div class="user-info">
                            <h4>Nguyễn Phương Anh</h4>
                            <p>Sinh viên K68 - ĐH Y Hà Nội</p>
                        </div>
                    </div>
                    <div class="stars-container">
                        <div class="stars">
                            <span class="star" style="--i:0">★</span>
                            <span class="star" style="--i:1">★</span>
                            <span class="star" style="--i:2">★</span>
                            <span class="star" style="--i:3">★</span>
                            <span class="star" style="--i:4">★</span>
                        </div>
                        <span class="rating-text">5.0/5</span>
                    </div>
                    <h3 class="testimonial-title">Thay đổi hoàn toàn tương lai của tôi</h3>
                    <p class="testimonial-text">
                        Ban đầu tôi định học Kinh tế theo mong muốn của bố mẹ. Nhưng sau khi làm bài test, 
                        tôi nhận ra mình có thiên hướng với Y khoa. Giờ đây tôi đang theo học ngành mơ ước 
                        và cảm thấy vô cùng hạnh phúc với lựa chọn của mình!
                    </p>
                </div>
            </div>

            <div class="navigation-section">
                <div class="nav-dots">
                    <span class="dot active"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>

            <div class="cta-section">
                <h3 class="cta-title">Sẵn sàng khám phá tương lai?</h3>
                <p class="cta-description">
                    Hãy bắt đầu hành trình tìm kiếm ngành học và trường đại học phù hợp với bạn ngay hôm nay. 
                    Hoàn toàn miễn phí và chỉ mất 10 phút!
                </p>
                <a href="<%=request.getContextPath()%>/DashboardController" class="cta-button">
                    <span>Khám Phá Ngay</span>
                    <span class="button-icon">🚀</span>
                </a>
            </div>
        </section>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Enhanced dot navigation with smooth transitions
                const dots = document.querySelectorAll('.dot');
                const cards = document.querySelectorAll('.testimonial-card');
                let currentIndex = 0;

                function updateActiveState(index) {
                    dots.forEach(dot => dot.classList.remove('active'));
                    dots[index].classList.add('active');

                    // Add subtle highlight effect to corresponding card
                    cards.forEach((card, i) => {
                        if (i === index) {
                            card.style.transform = 'translateY(-5px) scale(1.02)';
                            card.style.zIndex = '10';
                        } else {
                            card.style.transform = '';
                            card.style.zIndex = '1';
                        }
                    });
                }

                dots.forEach((dot, index) => {
                    dot.addEventListener('click', () => {
                        currentIndex = index;
                        updateActiveState(currentIndex);
                    });
                });

                // Auto-rotate with enhanced timing
                setInterval(() => {
                    currentIndex = (currentIndex + 1) % dots.length;
                    updateActiveState(currentIndex);
                }, 6000);

                // Add parallax effect to floating elements
                document.addEventListener('mousemove', (e) => {
                    const floatingElements = document.querySelectorAll('.floating-icon');
                    const centerX = window.innerWidth / 2;
                    const centerY = window.innerHeight / 2;

                    floatingElements.forEach((element, index) => {
                        const rect = element.getBoundingClientRect();
                        const elementCenterX = rect.left + rect.width / 2;
                        const elementCenterY = rect.top + rect.height / 2;

                        const deltaX = (e.clientX - elementCenterX) * 0.05;
                        const deltaY = (e.clientY - elementCenterY) * 0.05;

                        element.style.transform = `translate(${deltaX}px, ${deltaY}px)`;
                    });
                });

                // Add scroll-triggered animations
                const observerOptions = {
                    threshold: 0.1,
                    rootMargin: '0px 0px -50px 0px'
                };

                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            entry.target.style.animationPlayState = 'running';
                        }
                    });
                }, observerOptions);

                cards.forEach(card => {
                    observer.observe(card);
                });

                // Add dynamic particle movement
                const particles = document.querySelectorAll('.particle');
                particles.forEach((particle, index) => {
                    setInterval(() => {
                        const randomX = Math.random() * 100;
                        const randomY = Math.random() * 100;
                        particle.style.left = randomX + '%';
                        particle.style.top = randomY + '%';
                    }, 8000 + (index * 1000));
                });

            
                // Enhanced CTA button interaction
                const ctaButton = document.querySelector('.cta-button');
                ctaButton.addEventListener('mouseenter', () => {
                    ctaButton.style.background = 'linear-gradient(135deg, #b22222, #800000)';  /* Đảo ngược gradient khi hover */
                });

                ctaButton.addEventListener('mouseleave', () => {
                    ctaButton.style.background = 'linear-gradient(135deg, #800000, #b22222)';  /* Trở lại màu gốc */
                });
            });
        </script>
    </body>
</html>