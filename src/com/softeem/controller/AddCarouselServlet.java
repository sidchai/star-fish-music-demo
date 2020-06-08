package com.softeem.controller;

import com.softeem.pojo.Carousel;
import com.softeem.server.CarouselServer;
import com.softeem.server.Impl.CarouselServerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

@MultipartConfig
@WebServlet("/addCarousel.am")
public class AddCarouselServlet extends HttpServlet {
    private CarouselServer carouselServer;

    public AddCarouselServlet() {
        this.carouselServer = new CarouselServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收信息
        String title = req.getParameter("title");
        String sort = req.getParameter("sort");

        //上传文件
        //得到文件对象
        Part uploadFilePart = req.getPart("uploadPic");
        //得到上传文件的名称
        //得到保存了文件名的头文件
        String contentDisposition = uploadFilePart.getHeader("Content-Disposition");
        //截取出文件名
        String headerFileName = contentDisposition.split(";")[2];
        String uploadFileName = headerFileName.substring(headerFileName.indexOf("\"") + 1, headerFileName.length() - 1);
        //上传文件
        //生成上传后的文件名（要保证文件名唯一，防止覆盖）
        String saveFIleName = UUID.randomUUID().toString() + UUID.randomUUID().toString() + uploadFileName.substring(uploadFileName.lastIndexOf("."));
        InputStream is = null;
        OutputStream os = null;
        try {
            //得到文件上传的输入流
            is = uploadFilePart.getInputStream();
            //创建输入流保存上传的文件
            os = new FileOutputStream("E:/IDEA-workspace/StarFishMusic/web/img/carouselPic/" + saveFIleName);
            //定义缓存区
            byte[] buf = new byte[10240];
            //定义实际读取到的字节数量
            int len = 0;
            //完成上传
            while ((len = is.read(buf)) > 0) {
                os.write(buf, 0, len);
            }
            //上传成功保存上传的信息
            Carousel carousel = new Carousel();
            carousel.setTitle(title);
            carousel.setSort(sort);
            carousel.setPic("carouselPic/" + saveFIleName);
            //插入数据库
            carouselServer.addCarousel(carousel);
            //跳回主页
            resp.sendRedirect(req.getContextPath() + "/toCarousel.am");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                is.close();
            }
            if (os != null) {
                os.close();
            }
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
