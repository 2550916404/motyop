/**
 * Project Name:dt47_ssm_maven
 * File Name:Txt2String.java
 * Package Name:cn.java.utils.all
 * Date:2018年1月6日下午11:34:18
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:dt47_ssm_maven
 * File Name:Txt2String.java
 * Package Name:cn.java.utils.all
 * Date:2018年1月6日下午11:34:18
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package cn.java.utils.all;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

/**
 * Description: 读取text文件工具类 <br/>
 * Date: 2018年1月6日 下午11:34:18 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public class Txt2String {
    public static String txt2String(File file) {
        StringBuilder result = new StringBuilder();
        try {
            FileInputStream in = new FileInputStream(file);
            BufferedReader br = new BufferedReader(new InputStreamReader(in, "UTF-8"));
            String s = null;
            while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
                result.append(System.lineSeparator() + s);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }
}
