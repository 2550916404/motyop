/**
 * Project Name:Testr
 * File Name:Test.java
 * Package Name:cn.java.test
 * Date:2017年12月19日下午9:27:09
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
*/
/**
 * Project Name:Testr
 * File Name:Test.java
 * Package Name:cn.java.test
 * Date:2017年12月19日下午9:27:09
 * Copyright (c) 2017, bluemobi All Rights Reserved.
 *
 */

package cn.java.utils.all;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Description:实体类转map,map转实体类 <br/>
 * Date: 2017年12月19日 下午9:27:09 <br/>
 * 
 * @author caiqi
 * @version
 * @see
 */
public class CQ_BeanUtils {
    /**
     * 
     * Description:实体类转map <br/>
     *
     * @author caiqi
     * @param entity
     * @return
     * @throws Exception
     */
    public static Map<String, Object> bean2Map(Object entity) throws Exception {
        @SuppressWarnings("rawtypes")
        Class entityclass = entity.getClass();
        Field[] fields = entityclass.getDeclaredFields();
        Map<String, Object> map = new HashMap<String, Object>();
        for (Field field : fields) {
            field.setAccessible(true);
            map.put(field.getName(), field.get(entity));
        }
        return map;
    }

    /**
     * 
     * Description:map转实体类 <br/>
     *
     * @author caiqi
     * @param map
     * @param beanClass
     * @return
     * @throws Exception
     */
    public static Object Map2Bean(Map<String, Object> map, Class<?> beanClass) throws Exception {
        Object obj = beanClass.newInstance();
        if (map == null) {
            return null;
        } else {
            Field[] fields = obj.getClass().getDeclaredFields();
            // obj.getClass()得到该对象的Class。
            // getDeclaredFields()获得某个类的所有申明的字段
            //
            // obj.getClass().getDeclaredFields();
            // 获得对象的class文件通过class文件获取这个类中的所有申明字段
            for (Field field : fields) {
                System.out.println(field);
                int mod = field.getModifiers();
                // 判断是否存在Static 和 Final 修饰符，如果存在结束循环
                if (Modifier.isStatic(mod) || Modifier.isFinal(mod)) {
                    continue;
                }
                field.setAccessible(true);
                field.set(obj, map.get(field.getName()));
            }
        }
        return obj;
    }

    /**
     * 获取当前的时间yyyyMMddHHmmss
     */
    public static String getCurrentTime() {
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
    }

    /**
     * 获取当前的日期yyyyMMdd
     */
    public static String getCurrentDate() {
        return new SimpleDateFormat("yyyyMMdd").format(new Date());
    }
}
