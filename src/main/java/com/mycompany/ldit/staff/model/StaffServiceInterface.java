package com.mycompany.ldit.staff.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mycompany.ldit.staff.model.vo.Staff;

public interface StaffServiceInterface {
	public List<Staff> organization(Staff vo) throws Exception;


	//JH
//01_01 ��� �α��� üũ
public boolean loginCheck(Staff vo, HttpSession session);
//01_02 ��� �α��� ����
public Staff viewStaff(Staff vo);
//02 ��� �α� �ƿ�
public void logout(HttpSession session);

}
