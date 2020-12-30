package com.hknp.controller.api;

import com.hknp.model.dao.BrandDAO;
import com.hknp.model.entity.BrandEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/api/brands"})
public class BrandServlet extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      resp.setContentType("text/html; charset=UTF-8");

      ArrayList<BrandEntity> listBrand = BrandDAO.getInstance().gets();
      List<String> listJsonStr = new ArrayList<>();

      for (BrandEntity brand : listBrand) {
         listJsonStr.add(brand.toJson());
      }

      try (PrintWriter out = resp.getWriter()) {
         out.write("[" + String.join(", ", listJsonStr) + "]");
      }
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      resp.setContentType("text/html; charset=UTF-8");

      String result = "";

      try {
         String brandName = req.getParameter("brandName");
         String brandOrigin = req.getParameter("brandOrigin");

         String imageBase64 = req.getParameter("imageBase64");


         BrandEntity newBrand = new BrandEntity();
         newBrand.setBrandName(brandName);
         newBrand.setBrandOrigin(brandOrigin);

         if(imageBase64 != null && !imageBase64.isEmpty()) {
            newBrand.setImage(imageBase64);
         }
         Long newBrandId = BrandDAO.getInstance().insert(newBrand);

         if (newBrandId != 0) {
            result += "true\n" + newBrandId.toString();
         } else {
            result += "false\nError while insert brand";
         }
      } catch (Exception e) {
         result += "false\n" + e.getMessage();
      }

      try (PrintWriter out = resp.getWriter()) {
         out.write(result);
      }
   }

   @Override
   protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

   }
}