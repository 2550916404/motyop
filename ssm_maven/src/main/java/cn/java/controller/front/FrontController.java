/**
 * Project Name:dt47_ssm_maven
 * File Name:FrontController.java
 * Package Name:cn.java.controller.front
 * Date:上午10:58:03
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description: <br/>
 * Date: 上午10:58:03 <br/>
 * 
 * @author dingP
 * @version
 * @see
 */
@Controller
public class FrontController {
    @RequestMapping("test")
    public void test() {
        System.out.println("哈哈");
    }
}
