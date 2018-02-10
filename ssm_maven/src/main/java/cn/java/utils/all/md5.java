package cn.java.utils.all;

import java.security.MessageDigest;

public class md5 {
    private static final String[] digital = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e",
            "f" };

    public static String md5(String password) throws Exception {
        // 1、首先从Jsp表单中获取密码
        // 2、对password进行加密
        StringBuffer encry = new StringBuffer();
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte[] bytes = null;
        if (password != null) {
            bytes = md5.digest(password.getBytes("utf-8"));
        }
        // 3、将bytes变成一个32位的字符创
        for (int i = 0; i < bytes.length; i++) {
            int num = bytes[i];
            if (num < 0) {
                num = num + 256;
            }
            // 计算出两个下标
            int index1 = num / 16;
            int index2 = num % 16;
            encry = encry.append(digital[index1]).append(digital[index2]);
        }
        return encry.toString();
    }

    public static String md5Encry(String password) throws Exception {
        return md5((md5(password) + password) + password);
    }

}
