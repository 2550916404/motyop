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

import org.springframework.data.repository.CrudRepository;

import com.java.spring.boot.initstart.domain.User;

/**
 * Description: UserRepository 接口<br/>
 * Date: 2018年2月8日 下午11:23:51 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public interface UserRepository extends CrudRepository<User, Long> {

}
