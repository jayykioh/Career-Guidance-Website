/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AdmissionScoreDAO;
import DAO.MajorsDAO;
import DAO.UniversitiesDAO;
import Model.Universities;
import Model.admission_scores;
import Model.majors;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author mac
 */
public class MajorDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MajorDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MajorDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy và parse majorId
            String majorIdParam = request.getParameter("id");
            int majorId = Integer.parseInt(majorIdParam);
            
            UniversitiesDAO dao_1 = new UniversitiesDAO();
            MajorsDAO dao_2 = new MajorsDAO();
            AdmissionScoreDAO dao_3 = new AdmissionScoreDAO();
            
            majors major = dao_2.getMajorById(majorId); // <-- lấy 1 ngành
            request.setAttribute("major", major);

            // Lấy danh sách trường theo ngành
            List<Universities> list = dao_1.getAllUniversitiesWithMajor(majorId);
            request.setAttribute("universities", list);

            // Lấy danh sách điểm tuyển sinh
            List<admission_scores> list_1 = dao_3.getAdmissionScoresByMajor(majorId);
            request.setAttribute("admissions", list_1);

            // Forward sang trang JSP (chưa ghi gì ra response trước đó!)
            request.getRequestDispatcher("major_details.jsp").forward(request, response);

        } catch (Exception e) {
            // KHÔNG được in ra response nếu còn muốn forward
            e.printStackTrace(); // Chỉ log lỗi thôi

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
