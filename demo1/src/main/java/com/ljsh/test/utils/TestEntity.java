package com.ljsh.test.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Type;

public class TestEntity {
    public static boolean objCheckHasNull(Object object) {
        Class clazz = (Class) object.getClass(); // 得到类对象
        Field fields[] = clazz.getDeclaredFields(); // 得到所有属性
        boolean flag = false; // 定义返回结果，默认为false
        for (Field field : fields) {
            field.setAccessible(true);
            Object fieldValue = null;
            try {
                fieldValue = field.get(object); // 得到属性值
                Type fieldType = field.getGenericType();// 得到属性类型
                String fieldName = field.getName(); // 得到属性名
                /*System.out.println("属性类型：" + fieldType + ",属性名：" + fieldName
                        + ",属性值：" + fieldValue);*/
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            if (fieldValue == null) { // 只要有一个属性值为null 就返回true 表示对象有null值属性
                flag = true;
                break;
            }
        }
        return flag;
    }

    public static boolean objCheckHasName(Object object, String name) {
        Class clazz = (Class) object.getClass(); // 得到类对象
        Field fields[] = clazz.getDeclaredFields(); // 得到所有属性
        boolean flag = false; // 定义返回结果，默认为false
        for (Field field : fields) {
            field.setAccessible(true);
            Object fieldValue = null;
            String fieldType = null;
            String fieldName = null;
            try {
                fieldValue = field.get(object); // 得到属性值
                fieldType = field.getGenericType().toString();// 得到属性类型
                fieldName = field.getName(); // 得到属性名
                /*System.out.println("属性类型：" + fieldType + ",属性名：" + fieldName
                        + ",属性值：" + fieldValue);*/
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            if ( fieldType.equals("class java.lang.String") && fieldName.equals("name")) {
                if (fieldValue.equals(name)) {
                    flag = true;
                    break;
                }
                flag = false;
                break;
            }
        }
        return flag;
    }

}
