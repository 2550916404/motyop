/**
 * Project Name:dt47_ssm_maven
 * File Name:MessageService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午3:09:07
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import java.util.List;

import cn.java.entity.Message;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午3:09:07 <br/>
 * 
 * @author yuChaoya
 * @version
 * @see
 */
public interface MessageService {

    int addMessage(Message message);

    List<Message> selectByshop(Long id);

}
