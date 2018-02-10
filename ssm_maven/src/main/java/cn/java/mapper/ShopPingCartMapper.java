package cn.java.mapper;

import cn.java.entity.ShopPingCart;

public interface ShopPingCartMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ShopPingCart record);

    int insertSelective(ShopPingCart record);

    ShopPingCart selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ShopPingCart record);

    int updateByPrimaryKey(ShopPingCart record);
}