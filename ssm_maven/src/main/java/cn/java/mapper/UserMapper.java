package cn.java.mapper;

import java.util.List;
import java.util.Map;

import cn.java.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    // 验证用户名是否存在
    Map<String, Object> selectName(String username);

    // 验证手机号码是否存在
    Map<String, Object> selectphone(Long iphone);

    // 账号密码登录zhlogin
    Map<String, Object> zhlogin(String username, String password);

    // 分页查询
    List<Map<String, Object>> selectActiveAdmin(Map<String, Object> paramMap);

    // 条件查询
    Integer selectCountAdmin(Map<String, Object> paramMap);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    // 修改邮箱
    int updateemail(User record);

    // 修改手机号码
    int updatephone(User record);

    // 修改密码
    int updatepwd(User record);
}