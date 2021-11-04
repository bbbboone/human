package com.bbbboone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbbboone.domain.AuthVo;
import com.bbbboone.domain.MemberVo;
import com.bbbboone.domain.StudentVo;
import com.bbbboone.domain.WithdrawVo;
import com.bbbboone.mapper.MemberMapper;
import com.bbbboone.service.MemberService;
import com.bbbboone.service.WithdrawService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController{
	@Setter @Autowired
	private MemberService service;
	@GetMapping("/myinfo")
	public void myinfo() {
		log.info("myinfo");
	}
	@GetMapping("/register")
	public void register() {
		log.info("join start");
	}
	@PostMapping("/register")
	public String join(MemberVo membervo){
		log.info(membervo);
		service.join(membervo);
		log.info("join complete ::" + membervo.getId());
		return "redirect:/customLogin";
	}
	
	@GetMapping("{phoneNumber}")
	@ResponseBody
	public String sendSMS(@PathVariable String phoneNumber){
		Random rand = new Random();
		String numStr = "";
		for(int i = 0; i<6; i++){
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		log.info("수신자 번호 : " + phoneNumber);
		log.info("인증번호 : "+ numStr);
		service.confirmPhoneNumber(phoneNumber, numStr);
		return numStr;
	}
	
	
	@GetMapping("/modify")
	public void modify() {
		log.info("modify start");
	}
	@PostMapping("/modify")
	public String moidfy(MemberVo membervo){
		service.modify(membervo);
		log.info("modify complete" + membervo);
		return "redirect:/customLogin";
	}
	@GetMapping("/withdraw")
	public void withdraw() {
		log.info("withdraw start");
	}
	@PostMapping("/withdraw")
	public String withdraw(MemberVo membervo) {
		log.info(membervo);
		service.withdraw(membervo);
		log.info("withdraw compelete"+membervo);
		return "redirect:/common/index";
	}
	/*
	 * @GetMapping("test") public void test(MemberVo memberVo) { log.info(memberVo);
	 * }
	 * 
	 * @PostMapping("test") public void test2(MemberVo memberVo) {
	 * log.info(memberVo); }
	 */
	// 아이디 중복 검사
	@GetMapping("/idcheck")
	@ResponseBody
	public int idCheck(String id){
		int cnt = service.idCheck(id);
		log.info(id);
		log.info(cnt);
		return cnt;
	} 
	// 탈퇴 회원 아이디 중복 검사
	@GetMapping("/widcheck")
	@ResponseBody
	public int WIdcheck(String id){
		int cnt = service.wIdcheck(id);
		log.info(id);
		log.info(cnt);
		return cnt;
	} 
	@GetMapping("/emailcheck")
	@ResponseBody
	public int emailCheck(String email){
		int cnt = service.emailCheck(email);
		log.info(email);
		log.info(cnt);
		return cnt;
	} 
	@GetMapping("/phonecheck")
	@ResponseBody
	public int phoneCheck(String phone){
		int cnt = service.phoneCheck(phone);
		log.info(phone);
		log.info(cnt);
		return cnt;
	} 
	@GetMapping("/studnocheck")
	@ResponseBody
	public int studnoCheck(int studno) {
		int cnt = service.studnoCheck(studno);
		log.info(studno);
		log.info(cnt);
		return cnt;
	}
	@GetMapping("/studnocheckatstudent")
	@ResponseBody
	public StudentVo studnoCheckAtstudent(int studno) {
		int cnt = service.studnoCheckatStudno(studno);
		StudentVo vo = new StudentVo();
		log.info(studno);
		log.info(cnt);
		return vo;
	}
	@GetMapping("/pwcheck")
	public String pwCheck(String pw) {
		return pw;
	}
	@GetMapping("/studnovalue")
	@ResponseBody
	public StudentVo studnovalue(Long studno) {
		StudentVo vo = service.studonovalue(studno);
		log.info(vo);
		return vo;
	}
}



