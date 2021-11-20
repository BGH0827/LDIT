package com.mycompany.ldit.staff.model;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.ldit.staff.model.vo.Staff;

@Service("staffService")
public class StaffService implements StaffServiceInterface{

	@Autowired
	private StaffDao staffDao;
	
	@Override
	public List<Staff> organization(Staff vo) throws Exception {
		List<Staff> orlist = null;
		orlist = staffDao.organization();
		System.out.println(orlist);
		return orlist;
	}

	//JH
//01_01 ȸ�� �α��� üũ
//	@Inject
//	StaffDao staffDao;
	
	@Override
	public boolean loginCheck(Staff vo, HttpSession session) {
	boolean result = staffDao.loginCheck(vo);
	if(result) {//true �� ��� ���ǿ� ���
		Staff vo2 = viewStaff(vo);
		vo2.setStf_passwd("");
		//���� ���� ���
		session.setAttribute("loginUser", vo2);
		
		
		//session.setAttribute("stf_id", vo2.getStf_id());
		//session.setAttribute("stf_name", vo2.getStf_name());	
	}
	return result;
	}
	
	//01_02 ȸ�� �α��� ����
	@Override
	public Staff viewStaff(Staff vo) {
		//return vo;
		return staffDao.viewStaff(vo);
	}
	
	//02 ȸ�� �α� �ƿ�
	@Override
	public void logout(HttpSession session) {
		//���� ���� ���� ����
		//session.removeAttrubute("stf_id");
		//���� ������ �ʱ�ȭ ��Ŵ
		session.invalidate();
	}
	
}
