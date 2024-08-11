package utez.edu.mx.market.servlets.Product;

import com.google.gson.Gson;
import utez.edu.mx.market.daos.ProductDao;
import utez.edu.mx.market.entities.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetProductServlet", value = "/GetProductServlet")
public class GetProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        if(request.getSession(false) != null && request.getSession(false).getAttribute("user") != null) {
            long id = Long.parseLong(request.getParameter("id"));
            Product product = new ProductDao().findProductById(id);
            String json = new Gson().toJson(product);
            response.getWriter().write(json);
        } else {
            String forbidden = "{" +
                    "\"error\":403," +
                    "\"message\":\"Acceso no autorizado\"" +
                    "}";

            response.getWriter().write(forbidden);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}