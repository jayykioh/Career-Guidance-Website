<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Portal - Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'academic': '#800000',
                        'academic-light': '#a02020',
                        'academic-dark': '#600000',
                    }
                }
            }
        }
    </script>
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #800000 0%, #600000 100%);
            position: relative;
            overflow: hidden;
        }
        
        /* Dynamic floating shapes */
        .floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            pointer-events: none;
        }
        
        .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            animation: float 20s infinite linear;
        }
        
        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            left: 10%;
            animation-delay: 0s;
            animation-duration: 20s;
        }
        
        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            left: 20%;
            animation-delay: 2s;
            animation-duration: 25s;
        }
        
        .shape:nth-child(3) {
            width: 60px;
            height: 60px;
            left: 70%;
            animation-delay: 4s;
            animation-duration: 22s;
        }
        
        .shape:nth-child(4) {
            width: 100px;
            height: 100px;
            left: 80%;
            animation-delay: 6s;
            animation-duration: 28s;
        }
        
        .shape:nth-child(5) {
            width: 40px;
            height: 40px;
            left: 50%;
            animation-delay: 8s;
            animation-duration: 18s;
        }
        
        .shape:nth-child(6) {
            width: 160px;
            height: 160px;
            left: 30%;
            animation-delay: 10s;
            animation-duration: 30s;
        }
        
        .shape:nth-child(7) {
            width: 90px;
            height: 90px;
            left: 60%;
            animation-delay: 12s;
            animation-duration: 24s;
        }
        
        .shape:nth-child(8) {
            width: 70px;
            height: 70px;
            left: 40%;
            animation-delay: 14s;
            animation-duration: 26s;
        }
        
        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }
        
        /* Animated gradient overlay */
        .gradient-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, 
                rgba(128, 0, 0, 0.1) 0%, 
                rgba(160, 32, 32, 0.1) 25%, 
                rgba(96, 0, 0, 0.1) 50%, 
                rgba(128, 0, 0, 0.1) 75%, 
                rgba(160, 32, 32, 0.1) 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
        }
        
        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        /* Pulsing rings */
        .pulse-ring {
            position: absolute;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: pulse 4s cubic-bezier(0.455, 0.03, 0.515, 0.955) infinite;
        }
        
        .pulse-ring-1 {
            width: 200px;
            height: 200px;
            top: 20%;
            right: 10%;
            animation-delay: 0s;
        }
        
        .pulse-ring-2 {
            width: 300px;
            height: 300px;
            bottom: 30%;
            left: -50px;
            animation-delay: 2s;
        }
        
        .pulse-ring-3 {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 20%;
            animation-delay: 1s;
        }
        
        @keyframes pulse {
            0% {
                transform: scale(0.8);
                opacity: 1;
            }
            100% {
                transform: scale(1.5);
                opacity: 0;
            }
        }
        
        /* Particle trail effect */
        .particle {
            position: absolute;
            width: 4px;
            height: 4px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            animation: particle 8s linear infinite;
        }
        
        .particle:nth-child(odd) {
            animation-delay: 0s;
            animation-duration: 8s;
        }
        
        .particle:nth-child(even) {
            animation-delay: 4s;
            animation-duration: 12s;
        }
        
        @keyframes particle {
            0% {
                transform: translateX(-100px) translateY(100vh);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateX(100vw) translateY(-100px);
                opacity: 0;
            }
        }
        
        /* Geometric patterns */
        .geometric-bg {
            position: absolute;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 20% 20%, rgba(255,255,255,0.05) 1px, transparent 1px),
                radial-gradient(circle at 80% 80%, rgba(255,255,255,0.05) 1px, transparent 1px),
                radial-gradient(circle at 40% 60%, rgba(255,255,255,0.03) 1px, transparent 1px);
            background-size: 50px 50px, 30px 30px, 70px 70px;
            background-position: 0 0, 25px 25px, 10px 40px;
            animation: backgroundMove 20s linear infinite;
        }
        
        @keyframes backgroundMove {
            0% { transform: translate(0, 0); }
            100% { transform: translate(50px, 50px); }
        }
        
        .glass-effect {
            backdrop-filter: blur(20px);
            background: rgba(255, 255, 255, 0.95);
            position: relative;
            z-index: 10;
        }
        
        .input-focus:focus {
            box-shadow: 0 0 0 3px rgba(128, 0, 0, 0.1);
        }
        
        /* Card entrance animation */
        .card-entrance {
            animation: cardSlideIn 0.8s ease-out;
        }
        
        @keyframes cardSlideIn {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
        .upgrade-btn {
                background: linear-gradient(135deg, #730D0D, #F97316);

                position: relative;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .upgrade-btn::before {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(135deg, #FDE047, #F97316);
                transform: translateX(-100%);
                transition: transform 0.6s ease;
            }

            .upgrade-btn:hover::before {
                transform: translateX(100%);
            }

            .upgrade-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 20px 40px rgba(115, 13, 13, 0.5);
            }
    </style>
</head>
<body class="min-h-screen gradient-bg flex items-center justify-center p-4">
    <!-- Animated Background Effects -->
    <div class="gradient-overlay"></div>
    <div class="geometric-bg"></div>
    
    <!-- Floating Shapes -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <!-- Pulsing Rings -->
    <div class="pulse-ring pulse-ring-1"></div>
    <div class="pulse-ring pulse-ring-2"></div>
    <div class="pulse-ring pulse-ring-3"></div>
    
    <!-- Particle Effects -->
    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none;">
        <div class="particle" style="left: 10%;"></div>
        <div class="particle" style="left: 30%;"></div>
        <div class="particle" style="left: 50%;"></div>
        <div class="particle" style="left: 70%;"></div>
        <div class="particle" style="left: 90%;"></div>
    </div>
    
    <div class="w-full max-w-md">
        <!-- Main Card -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 border border-white/20 card-entrance">
            <!-- Header -->
            <div class="text-center mb-8">
                <div class="w-16 h-16 bg-academic rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                    </svg>
                </div>
                <h2 class="text-3xl font-bold text-academic mb-2">Nhom Cui Learning</h2>
                <p class="text-gray-600">Sign in to your explore more</p>
            </div>

            <!-- Login Form -->
            <form method="post" action="login" class="space-y-6">
                <!-- Username Field -->
                <div class="space-y-2">
                    <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </div>
                        <input 
                            type="text" 
                            name="username" 
                            id="username"
                            placeholder="Enter your username" 
                            required 
                            class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-academic focus:border-academic input-focus transition-colors duration-200 bg-white/50"
                        />
                    </div>
                </div>

                <!-- Password Field -->
                <div class="space-y-2">
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                            </svg>
                        </div>
                        <input 
                            type="password" 
                            name="password" 
                            id="password"
                            placeholder="Enter your password" 
                            required 
                            class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-academic focus:border-academic input-focus transition-colors duration-200 bg-white/50"
                        />
                    </div>
                </div>

                <!-- Remember Me -->
                <div class="flex items-center justify-between">
                    <label class="flex items-center cursor-pointer">
                        <input 
                            type="checkbox" 
                            name="remember" 
                            class="w-4 h-4 text-academic border-gray-300 rounded focus:ring-academic focus:ring-2"
                        />
                        <span class="ml-2 text-sm text-gray-700">Remember me</span>
                    </label>
                    <a href="#" class="text-sm text-academic hover:text-academic-light transition-colors duration-200">
                        Forgot password?
                    </a>
                </div>

                <!-- Login Button -->
                <button 
                    type="submit" 
                    class=" upgrade-btn w-full bg-academic hover:bg-academic-light text-white font-semibold py-3 px-4 rounded-lg transition-all duration-200 transform hover:scale-105 focus:ring-2 focus:ring-academic focus:ring-offset-2 shadow-lg"
                >
                    Sign In
                </button>

                <!-- Error Message -->
                <% if (request.getAttribute("error") != null) { %>
                    <div class="bg-red-50 border border-red-200 rounded-lg p-4 flex items-center space-x-2">
                        <svg class="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16c-.77.833.192 2.5 1.732 2.5z"></path>
                        </svg>
                        <span class="text-red-700 text-sm font-medium">${error}</span>
                    </div>
                <% } %>
            </form>

            <!-- Footer -->
            <div class="mt-8 text-center">
                <p class="text-sm text-gray-600">
                    Don't have an account? 
                    <a href="register" class="text-academic hover:text-academic-light font-medium transition-colors duration-200">
                        Register
                    </a>
                </p>
            </div>
        </div>

        <!-- Additional Info -->
        <div class="text-center mt-6">
            <p class="text-white/80 text-sm">
                Copyright ©Nhom Cui | All Right Reserved
            </p>
        </div>
    </div>
</body>
</html>