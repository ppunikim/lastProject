package com.callor.memo.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.DiaryVO;
import com.callor.memo.model.MemoVO;
import com.callor.memo.service.DiaryService;
import com.callor.memo.service.MemoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/write")
@Controller
public class WriteController {
	
	private final DiaryService diaryService;
	public WriteController(DiaryService diaryService) {
		this.diaryService = diaryService;
	}
	
	@Autowired
	private MemoService memoService;

	@RequestMapping(value="/home" , method=RequestMethod.GET)
	public String home() {
		return "write/w-home";
	}
	
	//다이어리 관련

	@ModelAttribute("diaryVO")
	public DiaryVO makeDiary() {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		DiaryVO diaryVO = DiaryVO.builder()
							.d_day(dayFormat.format(date))
							.build();
		return diaryVO;
	}

	
	@RequestMapping(value="/d-list" , method=RequestMethod.GET)
	public String d_home(Model model) {
		List<DiaryVO> dList = diaryService.selectAll();
		model.addAttribute("DIARYLIST",dList);
		log.debug(" 리스트확인" + dList.toString());
		return "write/d-list";
	}

	@RequestMapping(value="/d-add", method = RequestMethod.GET)
	public String insert() {
		return null;
	}
	
	@RequestMapping(value="/d-add", method = RequestMethod.POST)
	public String insert(@ModelAttribute("diaryVO") DiaryVO diaryVO) {
		diaryService.insert(diaryVO);
		return "redirect:/write/home";
	}
	
	
	@RequestMapping(value="/{d_day}/d-detail", method = RequestMethod.GET)
	public String view(Model model, @PathVariable("d_day") String d_day) {
		DiaryVO diaryVO = diaryService.findById(d_day);
		model.addAttribute("D_DIARY",diaryVO);
		return "write/d-add";
	}
	
	
	@RequestMapping(value="/{d_day}/d-detail", method = RequestMethod.POST)
	public String update(@ModelAttribute("diaryVO") DiaryVO diaryVO) {
		diaryService.update(diaryVO);
		return "redirect:/write/d-list";
	}
	
	
	@RequestMapping(value="/{d_day}/delete", method=RequestMethod.GET)
	public String delete(@PathVariable("d_day") String d_day) {
		diaryService.delete(d_day);
		return "redirect:/write/home";
	}
	
	
	
	
	
	
	
	
	// 메모 관련
	@ModelAttribute("memoVO")
	public MemoVO makeMemo() {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

		MemoVO memoVO = MemoVO.builder()
				.m_date(dayFormat.format(date))
				.m_time(timeFormat.format(date))
				.build();
		return memoVO;
	}

	
	@RequestMapping(value="/m-list", method=RequestMethod.GET)
	public String list(Model model, Principal principal) {
		List<MemoVO> mList = memoService.findByUsername(principal.getName());
		model.addAttribute("MEMOLIST", mList);
		return "write/m-list";
	}

	@RequestMapping(value="/m-list", method=RequestMethod.POST)
	public String insert(@ModelAttribute("memoVO") MemoVO memoVO
						,MultipartFile file, Principal principal) {
		memoVO.setM_username(principal.getName());
		log.debug("여기 insert {} ",memoVO);
		memoService.insert(memoVO);
		return "redirect:/write/home";
	}
	
	@RequestMapping(value="/{seq}/m-detail", method =RequestMethod.GET)
	public String detail(@PathVariable("seq") Long m_seq, Model model,
						 @ModelAttribute("memoVO") MemoVO memoVO,
						 Principal principal) {
		memoVO.setM_username(principal.getName());	
		memoVO = memoService.findById(m_seq);
		model.addAttribute("M_MEMO",memoVO);
		return "write/m-list";
	}
	
	@RequestMapping(value="/{seq}/m-detail", method = RequestMethod.POST)
	public String update(@PathVariable("seq") Long m_seq, 
			@ModelAttribute("memoVO") MemoVO memoVO,Principal principal) {
		memoVO.setM_username(principal.getName());	
		memoVO.setM_seq(m_seq);
		log.debug("업뎃 {}", memoVO);
		memoService.update(memoVO);
		//return String.format("redirect:/memo/%s/m-detail",m_seq);
		return "redirect:/write/home0";
	}
	
	@RequestMapping(value="/{seq}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable("seq") Long m_seq,
			@ModelAttribute("memoVO") MemoVO memoVO,Principal principal) {
		memoVO.setM_username(principal.getName());	
		memoService.delete(m_seq);
		return "redirect:/write/home";
	}

	
	
	//독서록 관련
	@RequestMapping(value="/b-list",method = RequestMethod.GET)
	public String book() {
		return "write/b-list";
	}
	
	
	
	
	
	
	
}
