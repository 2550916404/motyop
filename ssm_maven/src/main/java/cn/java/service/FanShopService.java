/**
 * Project Name:dt47_ssm_maven
 * File Name:FanShopService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月28日下午3:36:16
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.java.entity.History;
import cn.java.entity.Menu;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午3:36:16 <br/>
 * 
 * @author fanShaoLong
 * @version
 * @see
 */
public interface FanShopService {

    void indexCarousel(HttpServletRequest request);

    Menu detailspMenu(Long id);

    void historyShop(HttpServletRequest request, HttpServletResponse response, Long id);

    void historyClean(HttpServletRequest request, HttpServletResponse response);

    List<History> collSelect(Long browseId, Long index, Long size);

    int collDelete(Long browseId, Long sid);

    int collAdd(Long browseId, Long sid);

}
