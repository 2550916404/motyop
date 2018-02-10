/**
 * Project Name:dt47_ssm_maven
 * File Name:MessageServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午3:05:55
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.entity.Message;
import cn.java.mapper.MessageMapper;
import cn.java.service.MessageService;

/**
 * Description:留言业务层 <br/>
 * Date: 2017年12月28日 下午3:05:55 <br/>
 * 
 * @author yuChaoya
 * @version
 * @see
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper mm;

    @Override
    public int addMessage(Message message) {// 添加留言
        return mm.insertSelective(message);

    }

    @Override
    public List<Message> selectByshop(Long id) {// 查询店铺的留言
        return mm.selectByshop(id);

    }
}
