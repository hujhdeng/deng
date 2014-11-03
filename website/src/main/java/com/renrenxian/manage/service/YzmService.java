package com.renrenxian.manage.service;

import com.renrenxian.manage.model.Yzm;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface YzmService extends BaseServiceMybatis<Yzm, Integer> {

	public boolean send(String phone);

	public boolean checkYzm(String phone, String num);
}
