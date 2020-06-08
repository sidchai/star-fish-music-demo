package com.softeem.controller;

import com.softeem.utils.DownLoadUtils;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/downloadSong.do")
public class DownloadSongServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] ss = req.getParameter("url").split("/");
        String name = req.getParameter("name");
        String fileName = ss[ss.length-1];
        String[] url = fileName.split("\\.");
        String mime = url[url.length - 1];
        String mimeType = this.getServletContext().getMimeType(fileName);
        resp.setHeader("content-type",mimeType);
        //1.获取user-agent
        String header = req.getHeader("user-agent");
        name = DownLoadUtils.getFileName(header,name);
        //设置下载信息
        resp.setHeader("Content-Disposition", "attachment; filename=" + name+ "." + mime);
        //得到流
        FileInputStream fis = null;
        ServletOutputStream os = null;
        try {
            os = resp.getOutputStream();
            fis = new FileInputStream("E:/IDEA-workspace/StarFishMusic/web/media/song/" + fileName);
            byte[] buf = new byte[1024*8];
            int len = 0;
            while ((len = fis.read(buf)) > 0) {
                os.write(buf, 0, len);
            }
        }finally {
            if (os != null) {
                os.close();
            }
            if (fis != null) {
                fis.close();
            }
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
