package com.softeem.controller;

import com.softeem.pojo.User;
import com.softeem.server.Impl.UserServerImpl;
import com.softeem.server.UserServer;
import org.apache.commons.lang3.time.DateUtils;

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
import java.util.Date;
import java.util.UUID;
@MultipartConfig
@WebServlet("/addUserInfo.am")
public class AddUserInfoServlet extends HttpServlet {
    private UserServer userServer;

    public AddUserInfoServlet() {
        this.userServer = new UserServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String sex = req.getParameter("sex");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String birthdays = req.getParameter("birthday");
        String signature = req.getParameter("signature");
        String city = req.getParameter("city");
        String isAdmin = req.getParameter("isAdmin");

        //上传文件
        //得到文件对象
        Part uploadFilePart = req.getPart("uploadPic");
        //2.得到上传文件的名称
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
            os = new FileOutputStream("E:/IDEA-workspace/StarFishMusic/web/img/userPic/" + saveFIleName);
            //定义缓存区
            byte[] buf = new byte[10240];
            //定义实际读取到的字节数量
            int len = 0;
            //完成上传
            while ((len = is.read(buf)) > 0) {
                os.write(buf, 0, len);
            }
            //上传成功保存上传的信息
            //封装数据
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setPhone(phone);
            user.setSex("0".equals(sex) == true ? "男" : "女");
            user.setEmail(email);
            //将String日期装成Date保存
            Date birthday = DateUtils.parseDate(birthdays,"yyyy-MM-dd");
            user.setBirthday(birthday);
            user.setSignature(signature);
            user.setRegion(city);
            user.setIsAdmin(isAdmin);
            user.setPic("userPic/" + saveFIleName);
            //将数据插入数据库
            userServer.register(user);
            //跳回主页
            resp.sendRedirect(req.getContextPath() + "/toUserInfo.am");
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
