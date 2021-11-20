package com.mycompany.ldit.staff.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.ldit.staff.model.StaffServiceInterface;
import com.mycompany.ldit.staff.model.vo.Staff;


// �α��� ȭ��
@Controller("login")
//@RequestMapping("/staff/*")
public class StaffLoginController {
	//�α��� ���� ����
	private static final Logger logger = LoggerFactory.getLogger(StaffLoginController.class);
	
	@Inject
	StaffServiceInterface staffService;
	
	// �α��� ȭ��
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home() {
		return "login";
	}
	
	//�α��� ó��
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute Staff vo, HttpSession session) {
		boolean result = staffService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {//�α��� ����
			//main.jsp �̵�
			System.out.println("�����");
			mav.setViewName("redirect:main");
			
			//�ܼ��� JSP������ �ҷ����� ������
			// ���ΰ�ħ �ϸ� �α��� 
//			mav.setViewName("main");
//			mav.addObject("msg", "success");
		}else { //�α��� ����
			//login.jsp �̵�.
			mav.setViewName("login");
			mav.addObject("msg", "failure");
		}
		return mav;	
	}
	
	//�α� �ƿ� ó��
	
	
	
	

}
