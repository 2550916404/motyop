package cn.java.mapper;

import java.util.List;
import java.util.Map;

import cn.java.entity.Ordering;

public interface OrderingMapper {
    int deleteByPrimaryKey(Long id);

    int deleteByPrimaryKey1(String orderId);

    int insert(Ordering record);

    int insertSelective(Ordering record);

    List<Ordering> insertSelective1(Long vidId);// 查询所有订单

    List<Ordering> insertSelective1();// 查询所有

    Ordering selectByPrimaryKey(Long id);// 按订单号查询

    int updateByPrimaryKeySelective(Ordering record);

    int updateByPrimaryKey(Ordering record);

    List<Map<String, Object>> selectActiveAdmin(Map<String, Object> paramMap);

    Integer selectCountAdmin(Map<String, Object> paramMap);

    int cqupdateByPrimaryKeySelective(Ordering record);// 修改状态

    long showinde1();

    long showinde2();

    long showinde3();

}