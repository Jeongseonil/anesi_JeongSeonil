package com.example.anesi.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.User;


@Mapper
public interface LoginMapper {
	// 로그인
	User selectUser(HashMap<String, Object> map);
	// 로그인 아이디 존재 확인
	User userCheckId(HashMap<String, Object> map);
	// 로그인 실패 횟수 증가
	int updateCnt(HashMap<String, Object> map);
	// 로그인 실패 횟수 초기화
	int reSetCnt(HashMap<String, Object> map);	
	// 이메일 확인
	int selectUserEmail(HashMap<String, Object> map);
	//이메일 찾기
	User selectUserEmail1(HashMap<String, Object> map);
	// 비번 찾기
	User selectUserPwd(HashMap<String, Object> map);
}
