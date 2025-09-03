/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MajorsDAO;
import DAO.UniversitiesDAO;
import Model.majors;
import Model.Universities;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
@WebServlet(name = "UniversityController", urlPatterns = {"/UniversityController"})
public class UniversityController extends HttpServlet {

    private List<majors> getMockMajors(String universityCode) {
        List<majors> majors = new ArrayList<>();

        switch (universityCode) {
            case "FPT":
                majors.add(new majors(1, "Kỹ thuật phần mềm"));
                majors.add(new majors(2, "Trí tuệ nhân tạo"));
                majors.add(new majors(6, "Quản trị kinh doanh"));
                break;
            case "BKHCM":
                majors.add(new majors(4, "Khoa học máy tính"));
                majors.add(new majors(5, "Kỹ thuật điện"));
                break;
            case "CTU":
                majors.add(new majors(6, "Nông nghiệp"));
                majors.add(new majors(7, "Môi trường"));
                break;
            default:
                majors.add(new majors(0, "Ngành chung"));
                break;
        }

        return majors;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UniversityController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UniversityController at " + request.getContextPath() + "</h1>");
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

        String code = request.getParameter("code");
//        String name = request.getParameter("name");
//        String region = request.getParameter("region");
//        String location = request.getParameter("location");
//        String website = request.getParameter("website");
//      
//
//
//        request.setAttribute("universityCode", code);
//        request.setAttribute("universityName", name);
//        request.setAttribute("universityRegion", region);
//        request.setAttribute("universityLocation", location);
//        request.setAttribute("universityWebsite", website);
//          
//        System.out.println(website);
//
//        List<majors> majors = getMockMajors(code);
//        request.setAttribute("majors", majors);
//        System.out.println("Major size: " + majors.size());
        UniversitiesDAO uniDAO = new UniversitiesDAO();
        Universities university = uniDAO.getUniversitiesByCode(code);
        request.setAttribute("universityCode", university.getUniversity_code());
        request.setAttribute("universityName", university.getUniversity_name());
        request.setAttribute("universityRegion", university.getRegion_name());
        request.setAttribute("universityLocation", university.getLocation());
        request.setAttribute("universityWebsite", university.getUrl_pattern());

        MajorsDAO majorsDAO = new MajorsDAO();
        List<majors> majors = majorsDAO.getMajorsByUniversityCode(code);

        request.setAttribute("majors", majors);
        request.getRequestDispatcher("university_details.jsp").forward(request, response);

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
