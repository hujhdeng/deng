package com.renrenxian.manage.persistence;

import com.renrenxian.manage.model.ChatUser;

public interface ChatUserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table chat_user
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table chat_user
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    int insert(ChatUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table chat_user
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    int insertSelective(ChatUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table chat_user
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    ChatUser selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table chat_user
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    int updateByPrimaryKeySelective(ChatUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table chat_user
     *
     * @mbggenerated Thu Oct 30 00:39:34 CST 2014
     */
    int updateByPrimaryKey(ChatUser record);
}