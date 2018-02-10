package cn.java.mapper;

import java.util.List;
import java.util.Map;

import cn.java.entity.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);

    List<Message> selectByshop(Long id);

    // 分页查询
    List<Map<String, Object>> selectActiveAdminMessage(Map<String, Object> paramMap);

    // 条件查询
    Integer selectCountAdminMessage(Map<String, Object> paramMap);

}