package cn.java.mapper;

import java.util.List;
import java.util.Map;

import cn.java.entity.Menu;

public interface MenuMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    List<Menu> selectMenuByshop(Long id);// 根据店铺查询菜单

    List<Map<String, Object>> getMenuByshop(Long id);// 根据店铺id查询菜单信息

    List<Map<String, Object>> selectAllMenu();

    List<Map<String, Object>> selectAllMenu1(int index, int rows);// 分页的方法

    Map<String, Object> selectAllNum();// 查询所有信息的条数

    List<Map<String, Object>> selectCaixi();// 查询菜系

    List<Map<String, Object>> selectAddress();// 查询位置

    List<Map<String, Object>> selectCaitype();// 查询餐点

    List<Map<String, Object>> selectCainame();// 查询菜名

    List<Map<String, Object>> selectFood(String food);// 根据食物名查询菜品

    List<Map<String, Object>> selectFoodByType(String type);// 餐点查询

    List<Map<String, Object>> selectFoodByCaixi(String caixi);// 菜系查询

    List<Map<String, Object>> selectFoodByDiqu(String diqu);// 位置查询

    List<Map<String, Object>> paixuByprice();// 价格排序

    List<Map<String, Object>> paixuBygrade();// 评分排序

    // 随机查询三道不重复菜谱
    List<Menu> selectMenuThree();

    List<Map<String, Object>> selectActiveAdmin(Map<String, Object> paramMap);

    Integer selectCountAdmin(Map<String, Object> paramMap);

    int deleteMenu(Long id);

}