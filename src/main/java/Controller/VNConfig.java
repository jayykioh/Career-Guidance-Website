package Controller;

public class VNConfig {
    // VNPay configuration
    public static final String VNP_PAY_URL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static final String VNP_RETURN_URL = "http://localhost:8080/FinalPJ/vnpay-return";
    public static final String VNP_TMN_CODE = "P5GJEFM6"; // Thay bằng mã của bạn
    public static final String SECRET_KEY = "YE1QRSY4CWUUOT22UAWBHNQOQ9LZ9G5A"; // Thay bằng key của bạn
    public static final String VNP_API_URL = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";
    
    // Response codes
    public static final String SUCCESS_CODE = "00";
    
    // Package info
    public static final long PREMIUM_AMOUNT = 50000L; // VND
    public static final int PREMIUM_DURATION = 30; // days
}
