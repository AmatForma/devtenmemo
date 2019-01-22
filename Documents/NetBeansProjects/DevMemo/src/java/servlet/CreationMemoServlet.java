/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.Memo;
import bean.User;
import dao.MemoDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author esic
 */
@WebServlet(name = "CreationMemoServlet", urlPatterns = {"/creatmemo"})
public class CreationMemoServlet extends HttpServlet {

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
            out.println("<title>Servlet HomeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession(true);        
            User user = (User) session.getAttribute("u");
            List<User> destinataire = UserDao.getAll();
        if (user!= null){
            request.setAttribute("pers", user);
            request.setAttribute("destinataire", destinataire);
            request.getRequestDispatcher("/WEB-INF/creationmemo.jsp").forward(request, response);
            
        }
        else{
            request.setAttribute("msg", "Ola, on se connecte avant d'entrer!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        } catch (Exception e){
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
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
        String contenue = request.getParameter("contenue");

        String destinataire =request.getParameter("desti");
        String priorite = request.getParameter("priorite");
        if (destinataire.equals("destinatairenull")){
        HttpSession session = request.getSession(true);
        
        User u = (User) session.getAttribute("u");
        
        Memo m = new Memo(priorite, contenue, u);
        try {
            MemoDao.insert(m);
            response.sendRedirect("validcreat");
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
        }
        }
        else{
            HttpSession session = request.getSession(true);
        int dest = parseInt(destinataire);
        User u = (User) session.getAttribute("u");
        User v = new User();
        v.setId(dest);
        Memo m = new Memo(priorite,contenue, u, v);
        try {
            MemoDao.insertAvecDestinataire(m);
            response.sendRedirect("validcreat");
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e.getMessage());
        }
        }
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
