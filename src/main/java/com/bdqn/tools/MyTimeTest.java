package com.bdqn.tools;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by hp on 2018/1/4.
 */
public class MyTimeTest {
    public static void main(String[] args) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        //得到日历对象
        Calendar calendar = Calendar.getInstance();
        System.out.println("当前日期时间："+simpleDateFormat.format(calendar.getTime()));

        //获取当前年份
        int yyyy = calendar.get(Calendar.YEAR);
        System.out.println("当前年份："+yyyy);

        //获取当前月份
        int MM = calendar.get(Calendar.MONTH)+1;//1月是0,2月是1。。
        System.out.println("当前月份："+MM);

        //获取当前星期
        int weedDay = calendar.get(Calendar.DAY_OF_WEEK)-1;//周日是1，周一是2。。
        System.out.println("今天是星期："+weedDay);

        //获取本周三的日期
        calendar.add(Calendar.DAY_OF_WEEK,7);
        System.out.println("一周以后的时间："+simpleDateFormat.format(calendar.getTime()));

        //设置周一的日期
        calendar.set(2018,0,8,8,30);
        System.out.println("自己设置的时间（周一）：" + simpleDateFormat.format(calendar.getTime()));
        calendar.add(Calendar.MINUTE,30);
        System.out.println("自己设置的时间（周一）：" + simpleDateFormat.format(calendar.getTime()));
        calendar.add(Calendar.MINUTE,30);
        System.out.println("自己设置的时间（周一）：" + simpleDateFormat.format(calendar.getTime()));


        calendar.add(Calendar.DAY_OF_WEEK,2);
        System.out.println("自己设置的时间（周三）：" + simpleDateFormat.format(calendar.getTime()));
        calendar.add(Calendar.DAY_OF_WEEK,2);
        System.out.println("自己设置的时间（周五）：" + simpleDateFormat.format(calendar.getTime()));

        calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK,2);
        System.out.println("将日期设置为周一：" + simpleDateFormat.format(calendar.getTime()));


    }
}
