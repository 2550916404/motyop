/**
 * Project Name:dt47_ssm_maven
 * File Name:ShopServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:2017年12月27日下午3:11:46
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.entity.Shop;
import cn.java.entity.Shopdetail;
import cn.java.mapper.ShopMapper;
import cn.java.mapper.ShopdetailMapper;
import cn.java.service.ShopService;

/**
 * Description: 店铺业务层 <br/>
 * Date: 2017年12月27日 下午3:11:46 <br/>
 * 
 * @author yuChaoya
 * @version
 * @see
 */
@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopMapper sm;// 店铺信息

    @Autowired
    private ShopdetailMapper smm;// 店铺详情

    @Override
    public boolean addShop(Shop shop) {
        int flag = sm.insertSelective(shop);
        if (flag > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Shop selectShop(Long id) {
        return sm.selectByPrimaryKey(id);
    }

    @Override
    public Shopdetail selectShopdetail(Long id) {
        return smm.selectByPrimaryKey(id);
    }

}
