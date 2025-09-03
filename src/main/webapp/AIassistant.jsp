<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AI Education Chatbox</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <style>
            .ai-avatar svg {
                width: 28px;
                height: 28px;
                fill: white;
            }

            .floating-button {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 60px;
                height: 60px;
                background: linear-gradient(135deg, #800000, #b22222);
                border-radius: 50%;
                box-shadow: 0 8px 25px rgba(128, 0, 0, 0.3);
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s ease;
                z-index: 1001;
                animation: pulse 2s infinite;
            }

            .floating-button:hover {
                transform: scale(1.1);
                box-shadow: 0 12px 35px rgba(128, 0, 0, 0.4);
            }

            .floating-button svg {
                width: 28px;
                height: 28px;
                fill: white;
            }

            @keyframes pulse {
                0% {
                    box-shadow: 0 8px 25px rgba(128, 0, 0, 0.3);
                }
                50% {
                    box-shadow: 0 8px 25px rgba(128, 0, 0, 0.3), 0 0 0 10px rgba(128, 0, 0, 0.1);
                }
                100% {
                    box-shadow: 0 8px 25px rgba(128, 0, 0, 0.3);
                }
            }


            .close-button {
                position: absolute;
                top: 15px;
                right: 15px;
                width: 32px;
                height: 32px;
                background: rgba(255, 255, 255, 0.2);
                border: none;
                border-radius: 50%;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.2s ease;
                z-index: 10;
            }

            .close-button:hover {
                background: rgba(255, 255, 255, 0.3);
                transform: scale(1.1);
            }

            .close-button svg {
                width: 18px;
                height: 18px;
                fill: white;
            }

            /* Backdrop for mobile */
            .chatbox-backdrop {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.1);
                backdrop-filter: blur(2px);
                z-index: 999;
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
            }

            .chatbox-backdrop.active {
                opacity: 1;
                visibility: visible;
            }




            .chatbox-container {
                position: fixed;
                bottom: 90px;
                right: 20px;
                width: 100%;
                max-width: 450px;
                height: 700px;
                background: white;
                border-radius: 20px;
                box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
                overflow: hidden;
                display: none;
                flex-direction: column;
                z-index: 1000;
                transform: translateY(20px);
                opacity: 0;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .chatbox-container.active {  /* new class */
                display: flex;
                transform: translateY(0);
                opacity: 1;
            }

            .ai-header {
                background: linear-gradient(135deg, #800000, #b22222);
                color: white;
                padding: 20px 24px;
                display: flex;
                align-items: center;
                gap: 16px;
                position: relative;
                overflow: hidden;
            }

            .ai-header::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
                animation: shimmer 3s infinite;
            }

            @keyframes shimmer {
                0% {
                    left: -100%;
                }
                100% {
                    left: 100%;
                }
            }

            .ai-avatar {
                width: 48px;
                height: 48px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
            }

            .ai-info h3 {
                font-size: 18px;
                font-weight: 600;
                margin-bottom: 4px;
            }

            .ai-status {
                font-size: 13px;
                opacity: 0.9;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .status-dot {
                width: 8px;
                height: 8px;
                background: #4ade80;
                border-radius: 50%;
                animation: blink 2s infinite;
            }

            @keyframes blink {
                0%, 50% {
                    opacity: 1;
                }
                51%, 100% {
                    opacity: 0.3;
                }
            }

            /* Messages Area */
            .ai-messages {
                flex: 1;
                overflow-y: auto;
                padding: 20px;
                background: #f8fafc;
                display: flex;
                flex-direction: column;
                gap: 16px;
            }

            .ai-messages::-webkit-scrollbar {
                width: 6px;
            }

            .ai-messages::-webkit-scrollbar-track {
                background: #f1f1f1;
            }

            .ai-messages::-webkit-scrollbar-thumb {
                background: #cbd5e1;
                border-radius: 3px;
            }

            .message {
                display: flex;
                gap: 12px;
                animation: slideIn 0.3s ease-out;
            }

            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .message.user {
                flex-direction: row-reverse;
            }

            .message-avatar {
                width: 36px;
                height: 36px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                font-size: 16px;
            }

            .message.ai .message-avatar {
                background: linear-gradient(135deg, #800000, #b22222);
                color: white;
            }

            .message.user .message-avatar {
                background: linear-gradient(135deg, #667eea, #764ba2);
                color: white;
            }

            .message-content {
                max-width: 75%;
                padding: 12px 16px;
                border-radius: 18px;
                font-size: 14px;
                line-height: 1.5;
                word-wrap: break-word;
            }

            .message.ai .message-content {
                background: white;
                color: #334155;
                border-bottom-left-radius: 6px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }

            .message.user .message-content {
                background: linear-gradient(135deg, #667eea, #764ba2);
                color: white;
                border-bottom-right-radius: 6px;
            }

            /* Typing Indicator */
            .typing-indicator {
                display: flex;
                align-items: center;
                gap: 4px;
                padding: 12px 16px;
                background: white;
                border-radius: 18px;
                border-bottom-left-radius: 6px;
                max-width: 70px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }

            .typing-dot {
                width: 8px;
                height: 8px;
                background: #64748b;
                border-radius: 50%;
                animation: typing 1.4s infinite;
            }

            .typing-dot:nth-child(1) {
                animation-delay: 0s;
            }
            .typing-dot:nth-child(2) {
                animation-delay: 0.2s;
            }
            .typing-dot:nth-child(3) {
                animation-delay: 0.4s;
            }

            @keyframes typing {
                0%, 60%, 100% {
                    transform: translateY(0);
                }
                30% {
                    transform: translateY(-6px);
                }
            }

            /* Quick Actions */
            .quick-actions {
                padding: 16px 20px;
                background: #f8fafc;
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
                border-top: 1px solid #e2e8f0;
            }

            .quick-btn {
                background: white;
                border: 1px solid #e2e8f0;
                color: #667eea;
                padding: 8px 12px;
                border-radius: 16px;
                font-size: 12px;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .quick-btn:hover {
                background: #667eea;
                color: white;
                transform: translateY(-1px);
            }

            /* Input Area */
            .ai-input {
                padding: 20px;
                background: white;
                border-top: 1px solid #e2e8f0;
                display: flex;
                gap: 12px;
                align-items: flex-end;
            }

            .input-field {
                flex: 1;
                border: 2px solid #e2e8f0;
                border-radius: 20px;
                padding: 12px 16px;
                font-size: 14px;
                outline: none;
                transition: all 0.2s ease;
                resize: none;
                min-height: 44px;
                max-height: 120px;
                font-family: inherit;
            }

            .input-field:focus {
                border-color: #667eea;
                box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            }

            .send-btn {
                width: 44px;
                height: 44px;
                 background: linear-gradient(135deg, #800000, #b22222); 
                border: none;
                border-radius: 50%;
                color: white;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.2s ease;
                flex-shrink: 0;
            }

            .send-btn:hover {
                transform: scale(1.05);
            }

            .send-btn:disabled {
                opacity: 0.5;
                cursor: not-allowed;
            }

            .send-btn svg {
                width: 20px;
                height: 20px;
            }

            /* Mobile Responsive */
            @media (max-width: 480px) {
                body {
                    padding: 0;
                }

                .chatbox-container {
                    max-width: 100%;
                    height: 100vh;
                    border-radius: 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="floating-button" id="floatingBtn">
            <svg viewBox="0 0 24 24">
            <path d="M20,2H4A2,2 0 0,0 2,4V16A2,2 0 0,0 4,18H18L22,22V4A2,2 0 0,0 20,2M6,9H18V11H6V9M6,12H16V14H6V12M6,6H18V8H6V6Z"/>
            </svg>
        </div>

        <div class="chatbox-backdrop" id="chatboxBackdrop"></div>
        <div class="chatbox-container" id="chatboxContainer">
            <!-- Header -->
            <div class="ai-header">
                <button class="close-button" id="closeBtn">
                    <svg viewBox="0 0 24 24">
                    <path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"/>
                    </svg>
                </button>
                <div class="ai-avatar">
                    <svg viewBox="0 0 24 24">
                    <path d="M12,2A2,2 0 0,1 14,4C14,4.74 13.6,5.39 13,5.73V7H14A7,7 0 0,1 21,14H22A1,1 0 0,1 23,15V18A1,1 0 0,1 22,19H21V20A2,2 0 0,1 19,22H5A2,2 0 0,1 3,20V19H2A1,1 0 0,1 1,18V15A1,1 0 0,1 2,14H3A7,7 0 0,1 10,7H11V5.73C10.4,5.39 10,4.74 10,4A2,2 0 0,1 12,2M7.5,13A2.5,2.5 0 0,0 5,15.5A2.5,2.5 0 0,0 7.5,18A2.5,2.5 0 0,0 10,15.5A2.5,2.5 0 0,0 7.5,13M16.5,13A2.5,2.5 0 0,0 14,15.5A2.5,2.5 0 0,0 16.5,18A2.5,2.5 0 0,0 19,15.5A2.5,2.5 0 0,0 16.5,13Z"/>
                    </svg>
                </div>
                <div class="ai-info">
                    <h3>Bé Củi Chatbox</h3>
                    <div class="ai-status">
                        <div class="status-dot"></div>
                        Trợ lý tư vấn học tập
                    </div>
                </div>
            </div>
            <!-- Messages -->
            <div class="ai-messages" id="messages">
                <!-- Messages will be dynamically added here -->
            </div>
            <!-- Quick Actions -->
            <div class="quick-actions">
                <button class="quick-btn">
                    <svg viewBox="0 0 24 24" style="width: 14px; height: 14px; margin-right: 6px;">
                    <path d="M12,2L13.09,8.26L22,9L13.09,9.74L12,16L10.91,9.74L2,9L10.91,8.26L12,2Z"/>
                    </svg>
                    Gợi ý ngành học
                </button>
                <button class="quick-btn">
                    <svg viewBox="0 0 24 24" style="width: 14px; height: 14px; margin-right: 6px;">
                    <path d="M12,3L1,9L12,15L21,10.09V17H23V9M5,13.18V17.18L12,21L19,17.18V13.18L12,17L5,13.18Z"/>
                    </svg>
                    Trường đại học tốt
                </button>
                <button class="quick-btn">
                    <svg viewBox="0 0 24 24" style="width: 14px; height: 14px; margin-right: 6px;">
                    <path d="M16,11.78L20.24,4.45L21.97,5.45L16.74,14.5L10.23,10.75L5.46,19H22V21H2V3H4V17.54L9.5,8L16,11.78Z"/>
                    </svg>
                    Điểm chuẩn 2024
                </button>
            </div>
            <!-- Input -->
            <div class="ai-input">
                <textarea 
                    class="input-field" 
                    id="messageInput" 
                    placeholder="Nhập câu hỏi của bạn..."
                    rows="1"
                    ></textarea>
                <button class="send-btn" id="sendBtn">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                    <path d="M2,21L23,12L2,3V10L17,12L2,14V21Z"/>
                    </svg>
                </button>
            </div>
        </div>

        <script>
            // Floating chatbox controls
            document.addEventListener('DOMContentLoaded', function () {
                const floatingBtn = document.getElementById('floatingBtn');
                const chatboxContainer = document.getElementById('chatboxContainer');
                const chatboxBackdrop = document.getElementById('chatboxBackdrop');
                const closeBtn = document.getElementById('closeBtn');

                function toggleChatbox() {
                    const isActive = chatboxContainer.classList.contains('active');

                    if (isActive) {
                        chatboxContainer.classList.remove('active');
                        chatboxBackdrop.classList.remove('active');
                        floatingBtn.style.display = 'flex';
                    } else {
                        chatboxContainer.classList.add('active');
                        chatboxBackdrop.classList.add('active');
                        floatingBtn.style.display = 'none';
                        setTimeout(() => document.getElementById('messageInput').focus(), 300);
                    }
                }

                floatingBtn.addEventListener('click', toggleChatbox);
                closeBtn.addEventListener('click', toggleChatbox);
                chatboxBackdrop.addEventListener('click', toggleChatbox);

                chatboxContainer.addEventListener('click', function (e) {
                    e.stopPropagation();
                });

                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && chatboxContainer.classList.contains('active')) {
                        toggleChatbox();
                    }
                });
            });
            // ĐỒNG BỘ HOÀN CHỈNH - SỬ DỤNG LOGIC API TỪ FILE ĐẦU
            class AIAssistant {
                constructor(apiKey) {
                    this.apiKey = apiKey;
                    this.baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent';
                    this.chatHistory = [];
                    this.isTyping = false;
                }

                // Initialize the assistant
                init() {
                    this.setupEventListeners();
                    this.loadChatHistory();
                    console.log('AI Assistant initialized with Gemini API');


                    this.testConnection();
                }

                // Setup event listeners - ADAPTED FOR CHATBOX
                setupEventListeners() {
                    const messageInput = document.getElementById('messageInput');
                    const sendBtn = document.getElementById('sendBtn');

                    // Enter key support
                    messageInput.addEventListener('keypress', (e) => {
                        if (e.key === 'Enter' && !e.shiftKey) {
                            e.preventDefault();
                            this.sendMessage();
                        }
                    });

                    // Auto-resize textarea
                    messageInput.addEventListener('input', (e) => {
                        e.target.style.height = 'auto';
                        e.target.style.height = e.target.scrollHeight + 'px';
                    });

                    // Send button
                    sendBtn.addEventListener('click', () => this.sendMessage());

                    // Quick action buttons
                    document.querySelectorAll('.quick-btn').forEach(btn => {
                        btn.addEventListener('click', (e) => {
                            const message = e.target.textContent.replace(/^[🎯🏫📊]\s*/, '');
                            this.sendQuickMessage(message);
                        });
                    });
                }

                // Send message to API
                async sendMessage() {
                    const input = document.getElementById('messageInput');
                    const message = input.value.trim();

                    if (message === '' || this.isTyping)
                        return;

                    // Add user message to chat
                    this.addMessage(message, 'user');
                    input.value = '';
                    input.style.height = 'auto'; // Reset textarea height

                    // Show typing indicator
                    this.showTyping();

                    try {
                        // Get response from Gemini API
                        const response = await this.callGeminiAPI(message);
                        this.hideTyping();
                        this.addMessage(response, 'ai');

                        // Save to chat history
                        this.saveChatHistory();

                    } catch (error) {
                        console.error('Error calling Gemini API:', error);
                        this.hideTyping();

                        // Show specific error message based on error type
                        let errorMessage = 'Xin lỗi, đã có lỗi xảy ra. ';

                        if (error.message.includes('403')) {
                            errorMessage += 'API key không hợp lệ hoặc bị hạn chế. Vui lòng kiểm tra cấu hình API key.';
                        } else if (error.message.includes('404')) {
                            errorMessage += 'Endpoint không tồn tại. Đang thử endpoint khác...';
                            // Try alternative endpoint
                            this.tryAlternativeEndpoint(message);
                            return;
                        } else if (error.message.includes('429')) {
                            errorMessage += 'Đã vượt quá giới hạn request. Vui lòng thử lại sau.';
                        } else {
                            errorMessage += 'Vui lòng thử lại sau.';
                        }

                        this.addMessage(errorMessage, 'ai');
                    }
                }

                // Try alternative endpoint if main one fails
                async tryAlternativeEndpoint(message) {
                    const alternativeEndpoints = [
                        'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent',
                        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent'
                    ];

                    for (const endpoint of alternativeEndpoints) {
                        try {
                            console.log('Trying alternative endpoint: ' + endpoint);
                            const originalUrl = this.baseUrl;
                            this.baseUrl = endpoint;

                            const response = await this.callGeminiAPI(message);
                            this.hideTyping();
                            this.addMessage(response, 'ai');
                            console.log('✅ Alternative endpoint works: ' + endpoint);
                            return;

                        } catch (error) {
                            console.log('❌ Alternative endpoint failed: ' + endpoint);
                            this.baseUrl = originalUrl; // Restore original
                        }
                    }

                    // If all endpoints fail
                    this.addMessage('❌ Không thể kết nối với AI. Vui lòng kiểm tra cấu hình API key và thử lại.', 'ai');
                }

                // Send quick message
                sendQuickMessage(message) {
                    document.getElementById('messageInput').value = message;
                    this.sendMessage();
                }

                // Call Gemini API with improved error handling
                async callGeminiAPI(message) {
                    const prompt = this.buildPrompt(message);

                    const requestBody = {
                        contents: [{
                                parts: [{
                                        text: prompt
                                    }]
                            }],
                        generationConfig: {
                            temperature: 0.7,
                            topK: 40,
                            topP: 0.95,
                            maxOutputTokens: 1024,
                        },
                        safetySettings: [
                            {
                                category: "HARM_CATEGORY_HARASSMENT",
                                threshold: "BLOCK_MEDIUM_AND_ABOVE"
                            },
                            {
                                category: "HARM_CATEGORY_HATE_SPEECH",
                                threshold: "BLOCK_MEDIUM_AND_ABOVE"
                            },
                            {
                                category: "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                                threshold: "BLOCK_MEDIUM_AND_ABOVE"
                            },
                            {
                                category: "HARM_CATEGORY_DANGEROUS_CONTENT",
                                threshold: "BLOCK_MEDIUM_AND_ABOVE"
                            }
                        ]
                    };

                    console.log('🚀 Making request to: ' + this.baseUrl);
                    console.log('🔑 API Key: ' + this.apiKey.substring(0, 10) + '...');

                    const response = await fetch(this.baseUrl + '?key=' + this.apiKey, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(requestBody)
                    });

                    console.log('📊 Response status: ' + response.status);

                    if (!response.ok) {
                        const errorText = await response.text();
                        console.error('❌ API Error (' + response.status + '):', errorText);
                        throw new Error('API request failed: ' + response.status + ' - ' + errorText);
                    }

                    const data = await response.json();
                    console.log('✅ API Response received');

                    if (data.candidates && data.candidates[0] && data.candidates[0].content) {
                        return data.candidates[0].content.parts[0].text;
                    } else if (data.error) {
                        throw new Error('API Error: ' + data.error.message);
                    } else {
                        console.error('Unexpected response format:', data);
                        throw new Error('Invalid response format from API');
                    }
                }

                // Build prompt with context
                buildPrompt(userMessage) {
                    const context =
                            `Bạn là một trợ lý AI chuyên tư vấn giáo dục tại Việt Nam. Nhiệm vụ của bạn là:

    1. Tư vấn về trường đại học, cao đẳng
    2. Gợi ý ngành học phù hợp
    3. Cung cấp thông tin điểm chuẩn
    4. Định hướng nghề nghiệp
    5. Giải đáp thắc mắc về học tập

    Hãy trả lời một cách thân thiện, chính xác và hữu ích. Sử dụng emoji để làm cho câu trả lời sinh động hơn.

    Lịch sử trò chuyện gần đây:
    ` + this.getChatHistoryForPrompt() + `

    Câu hỏi mới: ` + userMessage + `

    Trả lời:`;

                    return context;
                }

                // Get chat history for prompt context
                getChatHistoryForPrompt() {
                    return this.chatHistory.slice(-6).map(msg =>
                        (msg.sender === 'user' ? 'Người dùng' : 'AI') + ': ' + msg.content
                    ).join('\n');
                }

                // Add message to chat UI - UPDATED FOR CHATBOX
                addMessage(content, sender) {
                    const messagesContainer = document.getElementById('messages');
                    const messageDiv = document.createElement('div');
                    messageDiv.className = `message ${sender}`;

                    const avatar = document.createElement('div');
                    avatar.className = 'message-avatar';
                    avatar.textContent = sender === 'ai' ? '🤖' : '👤';

                    const messageContent = document.createElement('div');
                    messageContent.className = 'message-content';
                    messageContent.innerHTML = this.formatMessage(content);

                    messageDiv.appendChild(avatar);
                    messageDiv.appendChild(messageContent);
                    messagesContainer.appendChild(messageDiv);

                    // Add to chat history
                    this.chatHistory.push({
                        content: content,
                        sender: sender,
                        timestamp: new Date().toISOString()
                    });

                    // Scroll to bottom
                    messagesContainer.scrollTop = messagesContainer.scrollHeight;
                }

                // Format message content
                formatMessage(content) {
                    return content
                            .replace(/\n/g, '<br>')
                            .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
                            .replace(/\*(.*?)\*/g, '<em>$1</em>');
                }

                // Show typing indicator
                showTyping() {
                    if (this.isTyping)
                        return;
                    this.isTyping = true;

                    const messagesContainer = document.getElementById('messages');
                    const typingDiv = document.createElement('div');
                    typingDiv.className = 'message ai';
                    typingDiv.id = 'typing-indicator';

                    const avatar = document.createElement('div');
                    avatar.className = 'message-avatar';
                    avatar.textContent = '🤖';

                    const typingIndicator = document.createElement('div');
                    typingIndicator.className = 'typing-indicator';
                    typingIndicator.innerHTML = `
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                    `;

                    typingDiv.appendChild(avatar);
                    typingDiv.appendChild(typingIndicator);
                    messagesContainer.appendChild(typingDiv);
                    messagesContainer.scrollTop = messagesContainer.scrollHeight;
                }

                // Hide typing indicator
                hideTyping() {
                    const typing = document.getElementById('typing-indicator');
                    if (typing) {
                        typing.remove();
                    }
                    this.isTyping = false;
                }

                // Save chat history to localStorage
                saveChatHistory() {
                    try {
                        // Keep only last 50 messages to prevent storage overflow
                        const recentHistory = this.chatHistory.slice(-50);
                        localStorage.setItem('ai_chat_history', JSON.stringify(recentHistory));
                    } catch (error) {
                        console.warn('Could not save chat history:', error);
                    }
                }

                // Load chat history from localStorage
                loadChatHistory() {
                    try {
                        const saved = localStorage.getItem('ai_chat_history');
                        if (saved) {
                            this.chatHistory = JSON.parse(saved);
                            this.displayChatHistory();
                        }
                    } catch (error) {
                        console.warn('Could not load chat history:', error);
                        this.chatHistory = [];
                    }
                }

                // Display saved chat history
                displayChatHistory() {
                    const messagesContainer = document.getElementById('messages');
                    // Clear initial message
                    messagesContainer.innerHTML = '';

                    // Add saved messages
                    this.chatHistory.forEach(msg => {
                        this.addMessageToUI(msg.content, msg.sender, false);
                    });

                    // Add welcome message if no history
                    if (this.chatHistory.length === 0) {
                        this.addWelcomeMessage();
                    }
                }

                // Add message to UI only (without saving to history)
                addMessageToUI(content, sender, shouldScroll = true) {
                    const messagesContainer = document.getElementById('messages');
                    const messageDiv = document.createElement('div');
                    messageDiv.className = `message ${sender}`;

                    const avatar = document.createElement('div');
                    avatar.className = 'message-avatar';
                    avatar.textContent = sender === 'ai' ? '🤖' : '👤';

                    const messageContent = document.createElement('div');
                    messageContent.className = 'message-content';
                    messageContent.innerHTML = this.formatMessage(content);

                    messageDiv.appendChild(avatar);
                    messageDiv.appendChild(messageContent);
                    messagesContainer.appendChild(messageDiv);

                    if (shouldScroll) {
                        messagesContainer.scrollTop = messagesContainer.scrollHeight;
                }
                }

                // Add welcome message
                addWelcomeMessage() {
                    const welcomeMsg = `Xin chào! Tôi là trợ lý AI của bạn. Tôi có thể giúp bạn:
                
    🎓 Tìm thông tin trường đại học
    📚 Gợi ý ngành học phù hợp  
    💼 Tư vấn định hướng nghề nghiệp
    📊 Thông tin điểm chuẩn
    ❓ Giải đáp thắc mắc về học tập

    Hãy đặt câu hỏi để tôi có thể hỗ trợ bạn tốt nhất!`;

                    this.addMessage(welcomeMsg, 'ai');
                }

                // Clear chat history
                clearHistory() {
                    this.chatHistory = [];
                    localStorage.removeItem('ai_chat_history');
                    const messagesContainer = document.getElementById('messages');
                    messagesContainer.innerHTML = '';
                    this.addWelcomeMessage();
                }

                // Check API connection with better error handling
                async testConnection() {
                    try {
                        console.log('🧪 Testing API connection...');
                        const response = await this.callGeminiAPI('Xin chào, bạn có thể trả lời bằng tiếng Việt được không?');
                        console.log('✅ API connection successful');

                        // Update UI to show connection status
                        this.updateConnectionStatus(true);
                        return true;

                    } catch (error) {
                        console.error('❌ API connection failed:', error);

                        // Show user-friendly error in chat
                        this.addMessage(
                                '⚠️ Không thể kết nối với AI. Có thể do:\n\n' +
                                '🔑 API key chưa đúng\n' +
                                '🚫 API key bị hạn chế (cần cấu hình lại)\n' +
                                '🌐 Vấn đề kết nối mạng\n' +
                                '💰 Đã hết quota miễn phí\n\n' +
                                'Vui lòng kiểm tra Google Cloud Console!',
                                'ai'
                                );

                        this.updateConnectionStatus(false);
                        return false;
                    }
                }

                // Update connection status in UI
                updateConnectionStatus(connected) {
                    const statusElement = document.querySelector('.ai-status');
                    const statusDot = document.querySelector('.status-dot');

                    if (statusElement && statusDot) {
                        if (connected) {
                            statusElement.innerHTML = '<div class="status-dot"></div>Chatbox xin chào hehe';
                            statusDot.style.background = '#4ade80';
                        } else {
                            statusElement.innerHTML = '<div class="status-dot"></div>Chatbox ngủ rồi';
                            statusDot.style.background = '#ef4444';
                        }
                    }
                }
            }

            // Initialize AI Assistant when DOM is loaded - API KEY SYNCED
            document.addEventListener('DOMContentLoaded', function () {
                // Replace with your actual API key
                const API_KEY = '';

                // Create and initialize AI Assistant
                window.aiAssistant = new AIAssistant(API_KEY);
                window.aiAssistant.init();
            });

            // Enhanced utility functions for debugging
            window.debugAI = {
                clearHistory: () => window.aiAssistant.clearHistory(),
                testAPI: () => window.aiAssistant.testConnection(),
                getHistory: () => window.aiAssistant.chatHistory,

                // New debug functions
                testEndpoint: (endpoint) => {
                    window.aiAssistant.baseUrl = endpoint;
                    window.aiAssistant.testConnection();
                },

                checkAPIKey: () => {
                    console.log('API Key:', window.aiAssistant.apiKey.substring(0, 10) + '...');
                    console.log('Current endpoint:', window.aiAssistant.baseUrl);
                },

                simulateMessage: (msg) => {
                    window.aiAssistant.sendMessage = async function () {
                        this.addMessage(msg || 'Test message', 'user');
                        this.showTyping();
                        setTimeout(() => {
                            this.hideTyping();
                            this.addMessage('Đây là tin nhắn test từ debug function!', 'ai');
                        }, 1000);
                    };
                }
            };
        </script>
    </body>
</html>