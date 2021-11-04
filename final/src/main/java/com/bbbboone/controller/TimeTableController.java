package com.bbbboone.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bbbboone.domain.TimeTableVo;
import com.bbbboone.service.TimeTableService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/timeTable")
@AllArgsConstructor
public class TimeTableController {
	private TimeTableService service;
	
	@PostMapping("new")
	public String create(@RequestBody List<TimeTableVo> vo) {
		
		log.info("create : " + vo);
		service.register(vo);
//		log.info(vo.get(0).getStudno());
		
		return "success";
	}
	@DeleteMapping("remove/{studno}")
	public String create(@PathVariable Long studno) {
		
		log.info("removeall : " + studno);
		service.remove(studno);
//		log.info(vo.get(0).getStudno());
		
		return "success";
	}
	
	@GetMapping("{studno}")
	public List<TimeTableVo> get(@PathVariable Long studno){
		log.info("timeTable get.. studno ::" + studno);
		return service.getList(studno);
	}
	@DeleteMapping("{id}")
	public boolean delete(@PathVariable Long id){
		log.info("timeTable delete.. id ::" + id);
		return service.removeOne(id);
	}

}
