package cn.java.mapper;

import java.util.List;
import java.util.Map;

import cn.java.entity.Shop;

public interface ShopMapper {
    // 首页轮播随机抽取页面 范绍龙
    List<Shop> lunboShop();

    // 首页餐馆随机抽取页面 范绍龙
    List<Shop> indexShop();

    int deleteByPrimaryKey(Long id);

    int insert(Shop record);

    int insertSelective(Shop record);

    Shop selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);

	int deleteShop(Long id);

	List<Map<String, Object>> selectActiveAdmin(Map<String, Object> paramMap);

	int selectCountAdmin(Map<String, Object> paramMap);
}