<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.tailwindcss.com"></script>

<header id="mainHeader" class="bg-[#800000] fixed top-0 left-0 right-0 w-full shadow-sm px-8 py-4 z-50 flex justify-end font-bold">
    <div class="flex items-center space-x-4 py-3">

        <!-- Search Box -->
        <div class="flex items-center bg-white rounded-full px-4 py-1">
            <input type="text" placeholder="Search..." 
                   class="bg-transparent outline-none text-sm text-black placeholder-gray-500" />
        </div>


        <c:if test="${empty sessionScope.currentUser}">
            <a href="${pageContext.request.contextPath}/login"
               class="text-white text-sm px-4 py-1 rounded-md hover:bg-[#a00000] hover:scale-105 transition">
                Sign in
            </a>

            <a href="${pageContext.request.contextPath}/register"
               class="bg-white text-[#800000] text-sm px-4 py-1 rounded-md hover:bg-gray-100 hover:text-[#a00000] hover:scale-105 transition">
                Register
            </a>
        </c:if>

     
        <c:if test="${not empty sessionScope.currentUser}">
            <!-- Avatar or User Icon -->
            <div class="relative group">
                <img src="${pageContext.request.contextPath}/images/final logo.jpg"
                     alt="Avatar"
                     class="w-8 h-8 rounded-full border-2 border-white cursor-pointer group-hover:scale-105 transition" />

                <!-- Dropdown -->
                <div class="absolute right-0 mt-2 w-40 bg-white rounded-md shadow-lg opacity-0 group-hover:opacity-100 transition duration-200 ease-in-out z-50">
                    <a href="${pageContext.request.contextPath}/profile"
                       class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                        Profile
                    </a>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100">
                        Logout
                    </a>
                </div>
            </div>
        </c:if>

    </div>
</header>
