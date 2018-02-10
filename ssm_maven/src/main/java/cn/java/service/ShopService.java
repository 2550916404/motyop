/**
 * Project Name:dt47_ssm_maven
 * File Name:ShopService.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月27日下午3:17:15
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import cn.java.entity.Shop;
import cn.java.entity.Shopdetail;

/**
 * Description: 商家业务层接口 <br/>
 * Date: 2017年12月27日 下午3:17:15 <br/>
 * 
 * @author yuChaoya
 * @version
 * @see
 */
public interface ShopService {

    boolean addShop(Shop shop);

    Shop selectShop(Long id);

    Shopdetail selectShopdetail(Long id);

}
