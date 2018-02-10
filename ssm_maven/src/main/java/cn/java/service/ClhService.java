/**
 * Project Name:dt47_ssm_maven
 * File Name:ClhService.java
 * Package Name:cn.java.service
 * Date:2017年12月28日下午2:54:11
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import cn.java.entity.Ruser;
import cn.java.entity.User;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午2:54:11 <br/>
 * 
 * @author CLH
 * @version
 * @see
 */
public interface ClhService {

    int selectName(String username);

    int selectphone(Long iphone);

    void selectphoneId(Long iphone);

    boolean zhlogin(String username, String password) throws Exception;

    boolean insertSelective(User record) throws Exception;

    int insertregiste(Ruser record);

    int updatetime(Ruser record);

    int updatenick(Ruser record);

    void selecticon(Long id);

    int updateemail(User user, Ruser ruser, String email);

    int updatephone(User user, Ruser ruser, String phone);

    int updatepwd(User user, String pwd) throws Exception;

}
