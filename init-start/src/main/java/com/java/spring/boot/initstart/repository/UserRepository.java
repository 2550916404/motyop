/**
 * Project Name:init-start
 * File Name:UserRepository.java
 * Package Name:com.java.spring.boot.initstart.repository
 * Date:2018年2月8日下午11:23:51
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:init-start
 * File Name:UserRepository.java
 * Package Name:com.java.spring.boot.initstart.repository
 * Date:2018年2月8日下午11:23:51
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package com.java.spring.boot.initstart.repository;

import java.util.List;

import com.java.spring.boot.initstart.domain.User;

/**
 * Description: UserRepository 接口<br/>
 * Date: 2018年2月8日 下午11:23:51 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public interface UserRepository {
    /***
     * 
     * Description:创建或者修改用户 <br/>
     *
     * @author caiqi
     * @param user
     * @return
     */
    User saveOrUpdateUser(User user);

    /**
     * 
     * Description:删除用户 <br/>
     *
     * @author caiqi
     * @param id
     */
    void deleteUser(Long id);

    /**
     * 
     * Description:根据id查询用户 <br/>
     *
     * @author caiqi
     * @param id
     * @return
     */
    User getUserById(Long id);

    /**
     * 
     * Description: 获取用户列表<br/>
     *
     * @author caiqi
     * @return
     */
    List<User> listUser();

}
