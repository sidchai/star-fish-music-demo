package com.softeem.controller;

import com.softeem.utils.code.Captcha;
import com.softeem.utils.code.GifCaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
/*
    生成验证码
 */
@WebServlet("/captcha.do")
public class CreateCaptchaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            resp.setHeader("Pragma", "No-cache");
            resp.setHeader("Cache-Control", "no-cache");
            resp.setDateHeader("Expires", 0);
            //返回一张图片
            resp.setContentType("image/jpg");
            //创建验证码
            Captcha captcha = new GifCaptcha(121,38,4);
            //发送到页面
            captcha.out(resp.getOutputStream());
            // 得到session对象
            HttpSession session = req.getSession(true);
            //存入Session
            session.setAttribute("_code",captcha.text().toLowerCase());
        }catch (Exception e){
            System.out.println("验证码获取失败！");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
