package com.renrenxian.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

/**
 * 时间处理函数
 * 
 * @20080509 15：50
 */
public class DateUtil {

    private static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static String getDate(String interval, Date starttime, String pattern) {
        Calendar temp = Calendar.getInstance(TimeZone.getDefault());
        temp.setTime(starttime);
        temp.add(Calendar.MONTH, Integer.parseInt(interval));
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(temp.getTime());
    }

    /**
     * 将字符串类型转换为时间类型
     * 
     * @return
     */
    public static Date str2Date(String str) {
        Date d = null;
        SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_PATTERN);
        try {
            d = sdf.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }

    /**
     * 返回当前时间的时间戳
     * @param str
     * @return
     */
    public static Long str2DateLong(String str) {
        Date date = str2Date(str);
        Calendar temp = Calendar.getInstance();
        temp.setTime(date);
        return temp.getTimeInMillis();
    }

    public static Date str2Date(String str, String pattern) {
        Date d = null;
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            d = sdf.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }

    /**
     * 将时间格式化
     * 
     * @return
     */
    public static Date DatePattern(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_PATTERN);
        try {
            String dd = sdf.format(date);
            date = str2Date(dd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 将时间格式化
     */
    public static Date DatePattern(Date date, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            String dd = sdf.format(date);
            date = str2Date(dd, pattern);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String date2Str(Date date) {
    	if(date == null) return "";
        SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_PATTERN);
        return sdf.format(date);
    }

    public static String date2Str(Date date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    /**
     * 获取昨天
     * 
     * @param date
     * @return
     * @throws Exception
     */
    public static Date getLastDate(Date date) {
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        calendar.setTime(date);

        calendar.add(Calendar.DATE, -1);

        return str2Date(date2Str(calendar.getTime()));
    }

    /**
     * 获取前几天
     * @param date
     * @return
     */
    public static Date getBeforeDate(Date date, int dates) {
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        calendar.setTime(date);

        calendar.add(Calendar.DATE, -dates);

        return str2Date(date2Str(calendar.getTime()));
    }

    /**
     * 获取上周第一天（周一）
     * 
     * @param date
     * @return
     * @throws Exception
     */
    public static Date getLastWeekStart(Date date) {
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        calendar.setTime(date);
        int i = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        int startnum = 0;
        if (i == 0) {
            startnum = 7 + 6;
        } else {
            startnum = 7 + i - 1;
        }
        calendar.add(Calendar.DATE, -startnum);

        return str2Date(date2Str(calendar.getTime()));
    }

    /**
     * 获取上周最后一天（周末）
     * 
     * @param date
     * @return
     * @throws Exception
     */
    public static Date getLastWeekEnd(Date date) {
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        calendar.setTime(date);
        int i = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        int endnum = 0;
        if (i == 0) {
            endnum = 7;
        } else {
            endnum = i;
        }
        calendar.add(Calendar.DATE, -(endnum - 1));

        return str2Date(date2Str(calendar.getTime()));
    }

    /**
     * 改更现在时间
     */
    public static Date changeDate(String type, int value) {
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        if (type.equals("month")) {
            calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + value);
        } else if (type.equals("date")) {
            calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + value);
        }
        return calendar.getTime();
    }

    /**
     * 更改时间
     */
    public static Date changeDate(Date date, String type, int value) {
        if (date != null) {
            // Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(date);
            // Calendar calendar = Calendar.
            if (type.equals("month")) {
                calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + value);
            } else if (type.equals("date")) {
                calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + value);
            } else if (type.endsWith("year")) {
                calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR) + value);
            }
            return calendar.getTime();
        }
        return null;
    }

    /**
     * 比较时间是否在这两个时间点之间
     * 
     * @param time1
     * @param time2
     * @return
     */
    public static boolean checkTime(String time1, String time2) {
        Calendar calendar = Calendar.getInstance();
        Date date1 = calendar.getTime();
        Date date11 = DateUtil.str2Date(DateUtil.date2Str(date1, "yyyy-MM-dd") + " " + time1);// 起始时间

        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, 1);
        Date date2 = c.getTime();
        Date date22 = DateUtil.str2Date(DateUtil.date2Str(date2, "yyyy-MM-dd") + " " + time2);// 终止时间

        Calendar scalendar = Calendar.getInstance();
        scalendar.setTime(date11);// 起始时间

        Calendar ecalendar = Calendar.getInstance();
        ecalendar.setTime(date22);// 终止时间

        Calendar calendarnow = Calendar.getInstance();

        if (calendarnow.after(scalendar) && calendarnow.before(ecalendar)) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 比较时间是否在这两个时间点之间
     * 
     * @param date11
     * @param date22
     * @return
     */
    public static boolean checkTime(Date date11, Date date22) {

        Calendar scalendar = Calendar.getInstance();
        scalendar.setTime(date11);// 起始时间

        Calendar ecalendar = Calendar.getInstance();
        ecalendar.setTime(date22);// 终止时间

        Calendar calendarnow = Calendar.getInstance();

        if (calendarnow.after(scalendar) && calendarnow.before(ecalendar)) {
            return true;
        } else {
            return false;
        }

    }

    public static boolean checkDate(String date1, String date2) {

        Date date11 = DateUtil.str2Date(date1, "yyyy-MM-dd HH:mm:ss");// 起始时间

        Date date22 = DateUtil.str2Date(date2, "yyyy-MM-dd HH:mm:ss");// 终止时间

        Calendar scalendar = Calendar.getInstance();
        scalendar.setTime(date11);// 起始时间

        Calendar ecalendar = Calendar.getInstance();
        ecalendar.setTime(date22);// 终止时间

        Calendar calendarnow = Calendar.getInstance();

        System.out.println(date11.toString());
        System.out.println(date22.toString());
        System.out.println(scalendar.toString());
        System.out.println(ecalendar.toString());
        System.out.println(calendarnow.toString());

        if (calendarnow.after(scalendar) && calendarnow.before(ecalendar)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取interval天之前的日期
     * 
     * @param interval
     * @param starttime
     * @param pattern
     * @return
     */
    public static Date getIntervalDate(String interval, Date starttime, String pattern) {
        Calendar temp = Calendar.getInstance();
        temp.setTime(starttime);
        temp.add(Calendar.DATE, Integer.parseInt(interval));
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String shijian = sdf.format(temp.getTime());
        return str2Date(shijian);
    }

    public static Date formatDate(Date date) {
        SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(bartDateFormat.format(date));
        SimpleDateFormat bartDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        try {
            date1 = bartDateFormat1.parse(bartDateFormat.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(date.getTime());
        return date1;

    }

    public static void main(String arf[]) {

        /*
         * String time1 = "2009-05-07 19:20:00"; String time2 =
         * "2009-05-08 19:30:00";
         * 
         * DateUtil d = new DateUtil(); System.out.println(d.checkDate(time1,
         * time2)); System.out.println(d.date2Str(new Date()));
         */

        // System.out.println(d.getIntervalDate("-3", new Date(),
        // DEFAULT_PATTERN));
        // Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        // System.out.println(calendar.toString());
        // System.out.println(DateUtil.str2Date("20090731","yyyyMMdd"));
        //
        // System.out.println(DateUtil.getBeforeDate(new Date(),2 ));
        // System.out.println(DateUtil.DatePattern(new Date()));
        //
        // SimpleDateFormat bartDateFormat =
        // new SimpleDateFormat("yyyy-MM-dd");
        // Date date = new Date();
        // System.out.println("date;"+bartDateFormat.format(date));
        // SimpleDateFormat bartDateFormat1 =new SimpleDateFormat("yyyy-MM-dd");
        // try {
        // Date date1 = bartDateFormat1.parse(bartDateFormat.format(date));
        // System.out.println("日期："+date1);
        // } catch (ParseException e) {
        // e.printStackTrace();
        // }
        //

    }

}
