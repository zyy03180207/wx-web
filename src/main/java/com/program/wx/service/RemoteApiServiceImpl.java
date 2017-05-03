package com.program.wx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import microservice.api.ServiceApi;
@Service
public class RemoteApiServiceImpl implements RemoteApiService {
	
	@Autowired
	@Qualifier("wxApi")
	private ServiceApi wxApi;

	public ServiceApi getWXAip() {
		// TODO Auto-generated method stub
		return wxApi;
	}
	
	
}
