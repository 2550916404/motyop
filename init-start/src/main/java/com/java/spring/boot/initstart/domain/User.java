package com.java.spring.boot.initstart.domain;

/**
 * Description: user 用户实体类 <br/>
 * Date: 2018年2月8日 下午11:15:33 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public class User {
    private Long id;// 实体一个唯一标识

    private String name;

    private String email;

    public User() {
        super();
    }

    public User(Long id, String name, String email) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
