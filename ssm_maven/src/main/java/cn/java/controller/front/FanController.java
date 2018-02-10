/**
 * Project Name:dt47_ssm_maven
 * File Name:FanController.java
 * Package Name:cn.java.controller.front
 * Date:2017年12月28日下午3:39:14
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.java.entity.History;
import cn.java.entity.Menu;
import cn.java.service.FanShopService;

/**
 * Description: <br/>
 * Date: 2017年12月28日 下午3:39:14 <br/>
 * 
 * @author fanShaoLong
 * @version
 * @see
 */
@Controller
public class FanController {
    @Autowired
    private FanShopService fss;

    @RequestMapping("pictureCarousel") // 首页轮播
    @ResponseBody
    public int pictureCarousel(HttpServletRequest request) {
        fss.indexCarousel(request);
        return 1;
    }

    @RequestMapping("detailspMenu") // 跳转detailspMenu.jsp获得menu菜品信息
    public String detailspMenu(Long id, Model model) {
        Menu detailspmenu = fss.detailspMenu(id);
        model.addAttribute("detailspmenu", detailspmenu);
        return "/front/detailsp.jsp";
    }

    /*
     * @RequestMapping("getCookieHistory") // 用cookie域存储浏览店铺记录 public void
     * getCookieHistory(HttpServletRequest request, HttpServletResponse
     * response, Long id) { fss.historyShop(request, response, id); }
     */

    @RequestMapping("historyClean") // shop.jsp页面清空店铺浏览历史记录
    public void historyClean(HttpServletRequest request, HttpServletResponse response) {
        fss.historyClean(request, response);
    }

    /*
     * 浏览收藏店铺信息
     */
    @RequestMapping("collSelect")
    public String collSelect(Long index, Long size, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("Sid") != null) {
            Long browseId = Long.parseLong(session.getAttribute("Sid").toString());// 浏览人ID
            index = 0L;
            size = 50L;
            List<History> collectionLsit = fss.collSelect(browseId, index, size);
            model.addAttribute("collectionLsit", collectionLsit);
        }
        return "/front/user_favorites.jsp";
    }

    /*
     * 取消店铺收藏
     */
    @RequestMapping("collDelete")
    @ResponseBody
    public int collDelete(Long sid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("Sid") != null) {
            Long browseId = Long.parseLong(session.getAttribute("Sid").toString());// 浏览人ID
            // System.out.println("browseId=" + browseId);
            int flag = fss.collDelete(browseId, sid);
            return flag;
        } else {
            return 0;
        }
    }

    /*
     * 收藏店铺
     */
    @RequestMapping("collAdd")
    @ResponseBody
    public int collAdd(Long sid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("Sid") != null) {
            Long browseId = Long.parseLong(session.getAttribute("Sid").toString());// 浏览人ID
            int flag = fss.collAdd(browseId, sid);
            return flag;
        } else {
            return -2;// 客户未登录或发生未知错误
        }

    }

}
