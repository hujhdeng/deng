package com.renrenxian.manage.model;

import java.util.Comparator;


public class ComparatorUser implements Comparator<User> {

	public int compare(User user0, User user1) {
		
		int flag = user0.getDistance().compareTo(user1.getDistance());
		return flag;
	}

}