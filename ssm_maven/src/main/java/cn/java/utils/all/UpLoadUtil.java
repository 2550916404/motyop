/**
 * Project Name:springMVCre
 * File Name:FileUpload.java
 * Package Name:cn.java.utils
 * Date:2017年11月29日下午4:14:59
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.utils.all;

import java.io.File;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

/**
 * Description: 基于SpringMVC框架的文件上传工具类 <br/>
 * Date: 2017年11月29日 下午4:14:59 <br/>
 * 
 * @author CLH
 * @version
 * @see
 */
public class UpLoadUtil {
    public static void fileuploads(MultipartRequest multipartRequest, HttpServletRequest request) throws Exception {
        Map<String, MultipartFile> map = multipartRequest.getFileMap();
        Set<String> keys = map.keySet();
        for (String key : keys) {
            MultipartFile file = map.get(key);
            // 获取文件名称
            String filename = file.getOriginalFilename();
            System.out.println("文件名称" + filename);
            // 获取file控件的值
            String name = file.getName();
            System.out.println("file值" + name);
            // 动态获取地址（绝对路径）
            String path = request.getServletContext().getRealPath("/upload") + "\\";
            // 切割文件名称
            String[] attr = filename.split("\\.");
            // 获取文件后缀名:如.jpg
            String extention = attr[attr.length - 1];
            System.out.println("地址" + path);
            // 随机生成文件名称
            String uuid = UUID.randomUUID().toString();
            // 最终保存的文件名称
            String[] attrupload = path.split("webapps");
            path = attrupload[0] + "webapps\\upload";
            // 判断指定目录upload是否存在，若不存在则创建
            File uploadFile = new File(path);
            boolean flag = uploadFile.exists();
            if (!flag) {
                uploadFile.mkdir();
            }
            String filepath = path + "\\" + uuid + "." + extention;
            System.out.println(filepath);
            // request.getSession().setAttribute("path", filepath);
            request.getSession().setAttribute("path", uuid + "." + extention);
            file.transferTo(new File(filepath));
        }
    }
}
