package cn.java.mapper;

import java.util.List;

import cn.java.entity.Consignee;

public interface ConsigneeMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Consignee record);

	int insertSelective(Consignee record);

	Consignee selectByPrimaryKey(Integer id);

	List<Consignee> selectByPrimaryKey1(Long vipid);

	List<Consignee> selectByPrimaryKeyid(Integer id);

	int updateByPrimaryKeySelective(Consignee record);

	int updateByPrimaryKey(Consignee record);
}