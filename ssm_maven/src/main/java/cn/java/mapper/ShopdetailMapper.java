package cn.java.mapper;

import cn.java.entity.Shopdetail;

public interface ShopdetailMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Shopdetail record);

    int insertSelective(Shopdetail record);

    Shopdetail selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Shopdetail record);

    int updateByPrimaryKey(Shopdetail record);
}