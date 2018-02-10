package cn.java.mapper;

import java.util.List;
import java.util.Map;

import cn.java.entity.History;

public interface HistoryMapper {
    int deleteByPrimaryKey(Long id);

    List<Map<String, Object>> selectActiveAdmin(Map<String, Object> paramMap);

    Integer selectCountAdmin(Map<String, Object> paramMap);

    int insert(History record);

    int insertSelective(History record);

    History selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(History record);

    int updateByPrimaryKey(History record);

    // 查询收藏店铺
    List<History> collSelect(Long browseId, Long index, Long size);

    // 取消店铺收藏
    int collDelete(Long browseId, Long sid);

    // 判断是否已收藏店铺
    int collSelectReady(Long browseId, Long sid);

    // 收藏店铺
    int collAdd(Long browseId, Long sid);

}