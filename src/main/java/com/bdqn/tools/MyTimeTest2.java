package com.bdqn.tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by hp on 2018/1/4.
 */
public class MyTimeTest2 {
    public static void main(String[] args) throws ParseException {
        Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2018-1-4 16:15:00");
        Calendar calendar1 = Calendar.getInstance();
        Calendar calendar2 = Calendar.getInstance();
        calendar1.setTime(date);
        System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar1.getTime()));
        System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar2.getTime()));
        System.out.println(calendar2.get(Calendar.MINUTE)-calendar1.get(Calendar.MINUTE));
    }
}
