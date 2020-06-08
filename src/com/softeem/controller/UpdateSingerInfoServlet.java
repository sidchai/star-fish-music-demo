package com.softeem.controller;

import com.softeem.pojo.Singer;
import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.SingerServer;
import org.apache.commons.lang3.time.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Date;
import java.util.UUID;

@MultipartConfig
@WebServlet("/updateSingerInfo.am")
public class UpdateSingerInfoServlet extends HttpServlet {
    private SingerServer singerServer;

    public UpdateSingerInfoServlet() {
        this.singerServer = new SingerServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String singerName = req.getParameter("singerName");//歌手名
        String classify = req.getParameter("classify");//歌手类型
        String rank = req.getParameter("rank");//歌手类型
        String debutTimes = req.getParameter("debutTime");//出道时间
        String region = req.getParameter("region");//歌手所在地
        String introduction = req.getParameter("introduction");//个人简介

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
            os = new FileOutputStream("E:/IDEA-workspace/StarFishMusic/web/img/singerListPic/" + saveFIleName);
            //定义缓存区
            byte[] buf = new byte[10240];
            //定义实际读取到的字节数量
            int len = 0;
            //完成上传
            while ((len = is.read(buf)) > 0) {
                os.write(buf, 0, len);
            }
            //上传成功修改上传的信息并保存
            Singer singer = (Singer) req.getSession().getAttribute("SINGER_INFO");
            //删除原歌手图片
            String[] ss = singer.getPic().split("/");
            String fileName = ss[ss.length - 1];
            File file = new File("E:/IDEA-workspace/StarFishMusic/web/img/singerListPic/" + fileName);
            file.delete();
            singer.setSingerName(singerName);
            //根据类型名得到id
            int classifyId = singerServer.getClassify(classify);
            singer.setClassifyId(classifyId);
            singer.setRank(Integer.parseInt(rank));
            //将String日期装成Date保存
            Date debutTime = DateUtils.parseDate(debutTimes, "yyyy-MM-dd");
            singer.setDebutTime(debutTime);
            singer.setRegion(region);
            singer.setIntroduction(introduction);
            singer.setPic("/singerListPic/" + saveFIleName);
            //插入数据库
            singerServer.updateSingerInfo(singer);
            //跳回主页
            resp.sendRedirect(req.getContextPath() + "/toSingerInfo.am");
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
