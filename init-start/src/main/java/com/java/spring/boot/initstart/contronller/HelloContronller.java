/**
 * Project Name:init-start
 * File Name:HelloContronller.java
 * Package Name:com.java.spring.boot.initstart.contronller
 * Date:2018年2月6日下午11:55:51
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:init-start
 * File Name:HelloContronller.java
 * Package Name:com.java.spring.boot.initstart.contronller
 * Date:2018年2月6日下午11:55:51
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package com.java.spring.boot.initstart.contronller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Description: <br/>
 * Date: 2018年2月6日 下午11:55:51 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
@RestController
public class HelloContronller {

    @RequestMapping("/hel")
    public String hello() {
        return "diyici";
    }

}
