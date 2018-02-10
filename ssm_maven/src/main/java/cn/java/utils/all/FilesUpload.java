/**
 * Project Name:dt47_springMVC4
 * File Name:FilesUpload.java
 * Package Name:cn.java.utils
 * Date:下午2:10:16
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
 * Description: 文件上传<br/>
 * Date: 下午2:10:16 <br/>
 * 
 * @author dingP
 * @version
 * @see
 */
public class FilesUpload {
    /**
     * 
     * Description: 可以同时上传多个文件<br/>
     *
     * @author dingP
     * @param multipleRequest：类型为MultipartRequest
     * @param request：类型为HttpServletRequest
     * @throws Exception
     */
    public static String uploadFiles(MultipartRequest multipleRequest, HttpServletRequest request) throws Exception {
        Map<String, MultipartFile> filesMap = multipleRequest.getFileMap();
        Set<String> keys = filesMap.keySet();

        String luJing = null;
        for (String k : keys) {

            MultipartFile file = filesMap.get(k);

            // 获取上传的文件的名字
            String fileName = file.getOriginalFilename();// error.gif
            // 动态获取upload的绝对地址
            String path = request.getServletContext().getRealPath("/dt47_ssm_maven/resources/images2") + "\\";// D:\\software\\upload\\
            // 文件对象.transferTo(地址)：可以将文件对象中封装的文件保存到指定地址中
            String uuid = UUID.randomUUID().toString();// 随机生成文件名
            // String filePath = path + uuid + fileName;
            // path"F:\\software\\eclipse_oxygen_x64_4.7\\apache-tomcat-9.0.0.M22\\webapps\\dt47_springMVC4\\upload
            String[] attr = path.split("webapps");
            path = attr[0] + "webapps\\dt47_ssm_maven/resources/images2";// \\D:\software\\eclipse_oxygen_x64_4.7\\apache-tomcat-9.0.0.M22\\webapps\\upload
            // 判断指定目录是否存在，如果不存在则创建新的文件夹
            File uploadFile = new File(path);
            boolean flag = uploadFile.exists();
            if (!flag) {
                uploadFile.mkdir();
            }
            file.transferTo(new File(path + "\\" + uuid + fileName));
            System.out.println(uuid + fileName);
            luJing = uuid + fileName;
            System.out.println("fileName" + fileName);
            if (fileName == null || fileName == "") {
                luJing = "";
            }

        }

        return luJing;
    }
}
