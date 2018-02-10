package cn.java.mapper;

import java.util.Map;

import cn.java.entity.Ruser;

public interface RuserMapper {
    int deleteByPrimaryKey(Long id);

    int insertregiste(Ruser record);

    int insertSelective(Ruser record);

    Map<String, Object> selecticon(Long id);

    int updateByPrimaryKeySelective(Ruser record);

    int updatetime(Ruser record);

    int updatenick(Ruser record);

    int updateemail(Ruser record);

    int updatephone(Ruser record);
}