package com.renrenxian.manage.service;

import java.util.Map;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Chat;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface ChatService extends BaseServiceMybatis<Chat,Integer> {

	Map<String, Object> send(int seid, int reid, String content);

	Page<Chat> list(Integer seid, Integer reid, int pageNo, int pagesize);

}
