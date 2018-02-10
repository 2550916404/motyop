/**
 * Project Name:init-start
 * File Name:UserRepositoryImpl.java
 * Package Name:com.java.spring.boot.initstart.repository
 * Date:2018年2月9日下午8:56:37
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:init-start
 * File Name:UserRepositoryImpl.java
 * Package Name:com.java.spring.boot.initstart.repository
 * Date:2018年2月9日下午8:56:37
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package com.java.spring.boot.initstart.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Repository;

import com.java.spring.boot.initstart.domain.User;

/**
 * Description: UserRepository 实现 <br/>
 * Date: 2018年2月9日 下午8:56:37 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
@Repository
public class UserRepositoryImpl implements UserRepository {
    private static AtomicLong counter = new AtomicLong(0);

    private final ConcurrentMap<Long, User> userMap = new ConcurrentHashMap<>();

    /**
     * 创建或者修改用户
     * 
     * @see com.java.spring.boot.initstart.repository.UserRepository#saveOrUpdateUser(com.java.spring.boot.initstart.domain.User)
     */
    @Override
    public User saveOrUpdateUser(User user) {
        Long id = user.getId();
        if (id == null) {
            // 新键
            id = counter.incrementAndGet();
            user.setId(id);
        }
        this.userMap.put(id, user);
        return user;
    }

    /**
     * 删除用户 <br/>
     * 
     * @see com.java.spring.boot.initstart.repository.UserRepository#deleteUser(java.lang.Long)
     */
    @Override
    public void deleteUser(Long id) {
        this.userMap.remove(id);
    }

    /**
     * 根据id查询用户 <br/>
     * 
     * @see com.java.spring.boot.initstart.repository.UserRepository#getUserById(java.lang.Long)
     */
    @Override
    public User getUserById(Long id) {
        return this.userMap.get(id);
    }

    /**
     * 获取用户列表<br/>
     * 
     * @see com.java.spring.boot.initstart.repository.UserRepository#listUser()
     */
    @Override
    public List<User> listUser() {
        return new ArrayList<User>(this.userMap.values());
    }
}
