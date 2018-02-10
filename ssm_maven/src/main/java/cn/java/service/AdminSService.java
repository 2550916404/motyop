/**
 * Project Name:dt47_ssm_maven
 * File Name:AdminSService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午3:43:36
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import java.util.List;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午3:43:36 <br/>
 * 
 * @author shaoJie
 * @version
 * @see
 */
public interface AdminSService {
    // 查询用户
    List<Object> selectActiveAdmin(String title1, Long type1, Integer pageSize, Integer pageNo);

    // 查询留言
    List<Object> selectActiveAdminMessage(String title1, Long type1, Integer pageSize, Integer pageNo);

    // 删除用户
    int deleteUserAdmin(long id);

    int deleteUserAdminMessage(long id);

    // 管理员登陆
    boolean superLogin(String user, String password);

    // 修改管理员密码
    boolean updateAdminUser(String admin_passwoed, String admin_user);

}
