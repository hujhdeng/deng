package com.renrenxian.manage.model;

import java.util.Date;

public class Suggest {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column suggest.id
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column suggest.txt
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    private String txt;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column suggest.regtime
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    private Date regtime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column suggest.id
     *
     * @return the value of suggest.id
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column suggest.id
     *
     * @param id the value for suggest.id
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column suggest.txt
     *
     * @return the value of suggest.txt
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    public String getTxt() {
        return txt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column suggest.txt
     *
     * @param txt the value for suggest.txt
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    public void setTxt(String txt) {
        this.txt = txt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column suggest.regtime
     *
     * @return the value of suggest.regtime
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    public Date getRegtime() {
        return regtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column suggest.regtime
     *
     * @param regtime the value for suggest.regtime
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }
}