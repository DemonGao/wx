package com.test;

import org.junit.Test;

import com.util.DBUtil;

public class ToKBorMB {

	@Test
	public void get(){
		
		System.out.println(DBUtil.byteToKBorMB(10111111L));
	}
}
