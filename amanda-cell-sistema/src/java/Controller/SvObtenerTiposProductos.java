package Controller;

import Model.Producto;
import ModelDAO.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.Gson;

@WebServlet("/obtenerTiposProductos")
public class SvObtenerTiposProductos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        ProductoDAO productoDAO = new ProductoDAO();
        List<Producto> productos = productoDAO.toList();

        // Construir datos para el gráfico circular
        JsonArray jsonArray = new JsonArray();
        for (Producto producto : productos) {
            JsonObject jsonItem = new JsonObject();
            jsonItem.addProperty("value", producto.getStock());
            jsonItem.addProperty("name", producto.getTipo());
            jsonArray.add(jsonItem);
        }

        // Convertir el JsonArray a JSON y enviarla como respuesta
        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(jsonArray));
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
