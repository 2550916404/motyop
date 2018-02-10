/**
 * Project Name:init-start
 * File Name:HelloContronller.java
 * Package Name:com.java.spring.boot.initstart.contronller
 * Date:2018年2月6日下午11:55:51
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:init-start
 * File Name:HelloContronller.java
 * Package Name:com.java.spring.boot.initstart.contronller
 * Date:2018年2月6日下午11:55:51
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
 */

package com.java.spring.boot.initstart.contronller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.java.spring.boot.initstart.domain.User;
import com.java.spring.boot.initstart.repository.UserRepository;

/**
 * Description:user 控制器 <br/>
 * Date: 2018年2月6日 下午11:55:51 <br/>
 * 
 * @author caiqi123
 * @version
 * @see
 */
@RestController
@RequestMapping("/users")
public class UserContronller {
    @Autowired
    private UserRepository userRepository;

    /**
     * 从 用户存储库 获取用户列表
     * 
     * @return
     */
    private List<User> getUserlist() {
        return userRepository.listUser();
    }

    /**
     * 
     * Description: 查询所有用户<br/>
     *
     * @author caiqi
     * @param model
     * @return
     */
    @GetMapping
    public ModelAndView list(Model model) {
        model.addAttribute("userlist", userRepository.listUser());
        model.addAttribute("title", "用户管理123");
        return new ModelAndView("users/list", "usermodel", model);
    }

    /**
     * 
     * Description:根据id查询用户
     *
     * @author caiqi
     * @param model
     * @return
     */
    @GetMapping("{id}")
    public ModelAndView view(@PathVariable("id") Long id, Model model) {
        User user = userRepository.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("title", "查看用户");
        return new ModelAndView("users/view", "usermodel", model);
    }

    /**
     * 
     * Description:获取表单页面
     * 
     * @author caiqi
     * @param model
     * @return
     */
    @GetMapping("/form")
    public ModelAndView createForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("title", "创建用户");
        return new ModelAndView("users/form", "usermodel", model);
    }

    /**
     * 
     * Description:新增用户 <br/>
     *
     * @author caiqi
     * @param user
     * @return
     */
    @PostMapping
    public ModelAndView create(User user) {
        user = userRepository.saveOrUpdateUser(user);
        return new ModelAndView("redirect:/users");
    }

    /**
     * 
     * Description: 删除用户<br/>
     *
     * @author caiqi
     * @param id
     * @param model
     * @return
     */
    @GetMapping(value = "delete/{id}")
    public ModelAndView delete(@PathVariable("id") Long id, Model model) {
        userRepository.deleteUser(id);
        model.addAttribute("userlist", getUserlist());
        model.addAttribute("title", "删除用户");
        return new ModelAndView("users/list", "userModel", model);
    }

    /**
     * 修改用户
     * 
     * @param user
     * @return
     */
    @GetMapping(value = "modify/{id}")
    public ModelAndView modifyForm(@PathVariable("id") Long id, Model model) {
        User user = userRepository.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("title", "修改用户");
        return new ModelAndView("users/form", "userModel", model);
    }
}
