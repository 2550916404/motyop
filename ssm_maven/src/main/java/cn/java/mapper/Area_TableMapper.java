package cn.java.mapper;

import cn.java.entity.Area_Table;

public interface Area_TableMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Area_Table record);

    int insertSelective(Area_Table record);

    Area_Table selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Area_Table record);

    int updateByPrimaryKey(Area_Table record);
}