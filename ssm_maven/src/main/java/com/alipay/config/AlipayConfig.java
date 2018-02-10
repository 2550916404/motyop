package com.alipay.config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
    // ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016082500308965";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCmOBnUBxfL2VUW9SZvz0MhGh/W98WQoRdJuOIUFELijWTDR2/0LxJegn2SpSkKk+6wa06I1Z0pYMjgrSBCrUqUifauYdYGPIDYTQoEbhDy8XG4TZQk9geM7I9iFZXj67NpEorJw80IE+6TxhEdbqtMfit4aoSLHFXOcPFvsYV/62ZA+yt+RboL/Ttb3w5t5M0LtsSMguTs2+ts8AxecY+KgEcOLVWdXrDzOpiYCn6owiLvyb5urrHlgQf1UFDowQCU6n8VlJwJUuAEQ0Rq52KMWJNenAYc3m1b6iI3VDmgNl3t2kDLXn07mfu73kCRZNOZpmaH8bZpxe9fkAWmJ41JAgMBAAECggEBAIN4RBWMNqopkD/ET06IZNQ90Yk6GK24fK726PpwvCZtJ5G9YzOEN8dA9wmSUM/pChXICin4q4Ia50euJ6IVZrPuG4r6H0p3eIGdDZtLY2SEzCm2UsKZRoeUZCR0ZkYMG6+z1sqXcAg/m6iONONOsXajJMbtmUBefQ/4DT8G7kyqIbGDSBK9mnQe3jVaAIvLMmlwliSj22Nq69WyGDfxNoOUeTVQ+zVMnoJn/6OwGcd4OWdS2wAgBYWpk6x+bDgMFytaCbaPaPeG8fOcMONYna6YYkHg0qSNRUlX5V1ogtGR2s3sJgmQFgTfq1raO+7Chrvj6qtX1TBYzN53GCazf7ECgYEA0RMYjv6pB2fGH3IDkSOJF4yst1yWiqDVtJx6Y1ZDF+gDJQMITGXuXbkS1AErwPxTYTiZ/kIpvDxmpCvrsB7WHO9T81vQvkaalY34zxQbLESVeKyRO0pBSew36TR/Op85sApq59iAHJwQLGjGGrWU/wYAiMjvajOnY3b2YGgNa3cCgYEAy4ajSjr04GJ3JFj+63kKJqrSB40TfIkI7JfaZjtHlUNBvymxucqww/3F2p4FxM6eM/VumS7vLAlkOdZhmiOVCiGuOfBIQ5TFZo9tikLv2CI86DEHgqwNocEPQOgOJSPFhcSVWwO1d7s515HOr72shYHBxE5L66ZlC3KvYePnfT8CgYEAkvCE1hsM2POKPxd2gk8jTrXDvasI8q1PBPzk12QNC4Q4kY6sCmWpPZ2RKgcYpS2xvCZ3tEbz5iPdT4y+vK0vdm6N5f+lmdUtV+bL814CKv6YvpMqDy2E7VtjgDcxJBY8CQmJUSDMCU913oBUmvj7mrCxN3FhMpbTEgjN57u5kskCgYEAriEQPec5MW0tMCzwVXimhbSqo4lA/dCkkP/O/J6FPSBg9PPwOdw/5j+N8uA2YU7BrgSzTl4IhS230YAo217MGfH9BVceDKwRRBE8kAl6+Pk6ERI5scQQma76pPale4MicLNjcY43ySunblcydcua+lKs/I5ciE5Br0y83szFdrMCgYAj3iI+V4i65FnjkywuzAzLQnHdVopvhfWYUODBxKyaJzBRFMMfZtgMMez4zj541Z5SLDBTZxm5Y1BqqFCXzYPgFByurRLotZ06h4RYFRuCwBX1Br7VxXCVU1YT8GAxh8iyMdXZgcS56NNG1771CsFcSBEgJqcgSNKzqkFVDZxM4w==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
    // 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArm7NbqHSTtQ+1/wriF++H8uVJlOuybt/FNFPbJdaYMFmR2Ri/cNVl9Qru1ifulV/gPLGehI2eE7J6/+ACEBpRBGJ5wb8d9JUciUnhkGmCHqnW3P68k7/sLHxTbIk819xO33AodytHrHk2GU9+rBcgWfSq21+NqN71+8TnmAp3rptoJVVo1oRUxvO3+S4vsujk4zOcmyYAIp3HBCTJoWvXEIwpBM3VJYppMZjTTO2Yr6XiiZgWtSBPH3k+T1Xfv1sZtiXC2141m+llvOD/W662tjMWm/5Sn6UQ0/cQzcSBocTOkP6jAXPCAVGXhXVJwlxM7yRT+QHQss4PvTpncTTHwIDAQAB";

    // 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://www.haoji8.cn:8080/dt47_ssm_maven/returnUrlhl.shtml";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://www.haoji8.cn:8080/dt47_ssm_maven/return_url.shtml";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

}
