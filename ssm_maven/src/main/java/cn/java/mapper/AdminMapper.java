package cn.java.mapper;

import java.util.Map;

import cn.java.entity.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    // 账号密码登录zhlogin

    Map<String, Object> superLogin(String admin_user, String admin_passwoed);

    // 验证密码superLoginYanZheng

    Integer superLoginYanZheng(String admin_passwoed);

    // updateAdminUser 修改管理员密码

    Integer updateAdminUser(String admin_passwoed, String admin_user);

}