package com.callor.memo.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.config.NaverConfig;
import com.callor.memo.config.QualifierConfig;
import com.callor.memo.model.BookVO;
import com.callor.memo.model.DiaryVO;
import com.callor.memo.model.MemoVO;
import com.callor.memo.service.BookService;
import com.callor.memo.service.DiaryService;
import com.callor.memo.service.MemoService;
import com.callor.memo.service.NaverService;
import com.callor.memo.service.impl.NaverServiceImplV1;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value = "/write")
@Controller
public class WriteController {

	private final DiaryService diaryService;
	private final NaverService naverService;
	private final BookService bookService;

	public WriteController(DiaryService diaryService,
			@Qualifier(QualifierConfig.SERVICE.NAVER_V1) NaverServiceImplV1 naverService
			,BookService bookService) {
		this.diaryService = diaryService;
		this.naverService = naverService;
		this.bookService = bookService;
	}

	@Autowired
	private MemoService memoService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "write/w-home";
	}

	// 다이어리 관련

	@ModelAttribute("diaryVO")
	public DiaryVO makeDiary() {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");

		DiaryVO diaryVO = DiaryVO.builder().d_day(dayFormat.format(date)).build();
		return diaryVO;
	}

	@RequestMapping(value = "/d-list", method = RequestMethod.GET)
	public String d_home(Model model) {
		List<DiaryVO> dList = diaryService.selectAll();
		model.addAttribute("DIARYLIST", dList);
		return "write/d-list";
	}

	@RequestMapping(value = "/d-add", method = RequestMethod.GET)
	public String insert() {
		return null;
	}

	@RequestMapping(value = "/d-add", method = RequestMethod.POST)
	public String insert(@ModelAttribute("diaryVO") DiaryVO diaryVO) {
		diaryService.insert(diaryVO);
		return "redirect:/write/home";
	}

	@RequestMapping(value = "/{d_day}/d-detail", method = RequestMethod.GET)
	public String view(Model model, @PathVariable("d_day") String d_day) {
		DiaryVO diaryVO = diaryService.findById(d_day);
		model.addAttribute("D_DIARY", diaryVO);
		return "write/d-add";
	}

	@RequestMapping(value = "/{d_day}/d-detail", method = RequestMethod.POST)
	public String update(@ModelAttribute("diaryVO") DiaryVO diaryVO) {
		diaryService.update(diaryVO);
		return "redirect:/write/d-list";
	}

	@RequestMapping(value = "/{d_day}/delete", method = RequestMethod.GET)
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

		MemoVO memoVO = MemoVO.builder().m_date(dayFormat.format(date)).m_time(timeFormat.format(date)).build();
		return memoVO;
	}

	@RequestMapping(value = "/m-list", method = RequestMethod.GET)
	public String list(Model model, Principal principal) {
		List<MemoVO> mList = memoService.findByUsername(principal.getName());
		model.addAttribute("MEMOLIST", mList);
		return "write/m-list";
	}

	@RequestMapping(value = "/m-list", method = RequestMethod.POST)
	public String insert(@ModelAttribute("memoVO") MemoVO memoVO, MultipartFile file, Principal principal) {
		memoVO.setM_username(principal.getName());
		memoService.insert(memoVO);
		return "redirect:/write/home";
	}

	@RequestMapping(value = "/{seq}/m-detail", method = RequestMethod.GET)
	public String detail(@PathVariable("seq") Long m_seq, Model model, @ModelAttribute("memoVO") MemoVO memoVO,
			Principal principal) {
		memoVO.setM_username(principal.getName());
		memoVO = memoService.findById(m_seq);
		model.addAttribute("M_MEMO", memoVO);
		return "write/m-list";
	}

	@RequestMapping(value = "/{seq}/m-detail", method = RequestMethod.POST)
	public String update(@PathVariable("seq") Long m_seq, @ModelAttribute("memoVO") MemoVO memoVO,
			Principal principal) {
		memoVO.setM_username(principal.getName());
		memoVO.setM_seq(m_seq);
		memoService.update(memoVO);
		return "redirect:/write/home0";
	}

	@RequestMapping(value = "/{seq}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable("seq") Long m_seq, @ModelAttribute("memoVO") MemoVO memoVO,
			Principal principal) {
		memoVO.setM_username(principal.getName());
		memoService.delete(m_seq);
		return "redirect:/write/home";
	}


	//	도서, 뉴스 정보 더보기 눌렀을 때
	@RequestMapping(value = "/api_book_news", method = RequestMethod.GET)
	public String bookNews(Model model) {
		List<Object> newsLists = naverService.todayNews();
		model.addAttribute("NEWS", newsLists);
		return "write/api_BN";
	} 

	// 검색어를 입력했을 때
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public Object search(String search, String cat, Model model) {
		String queryString = naverService.queryString(cat, search);
			List<Object> naverList = naverService.getNaver(queryString);
			model.addAttribute("NAVER", naverList);

		return "write/api_BN";
	}// 검색어 입력하면 api 데이터 나오도록 하기

	
	//검색에 detail 보기(비동기 방식)
	@RequestMapping(value="/{title}/api_detail", method=RequestMethod.GET)
	public String naver_api_detail(String title, Model model, String queryString) {
		//리스트를 가져오는게 아니라 title 별로 search 할 수 있는 service 를 만들어야 한다
		List<Object> findList = naverService.FindByTitle(title);
		List<Object> naverList = naverService.getNaver(queryString);
		model.addAttribute("NAVER", naverList);
		return "write/api_detail";
	}
	
	
	// @Responsebody 는 return 에 있는 String 값으로 이동해라 라는 말이다.
	
	
	// 독후감 클릭했을 때
	@RequestMapping(value = "/b-list", method = RequestMethod.GET)
	public String book(Model model) {
		List<BookVO> bookList = bookService.selectAll();
		model.addAttribute("BOOK", bookList);
		return "write/b-list";
	}
	
	@RequestMapping(value="/b-insert", method = RequestMethod.GET)
	public String bookInsert() {
		return null;
	}
	@RequestMapping(value="/b-insert", method = RequestMethod.POST)
	public String bookInsert(BookVO bookVO) {
		bookService.insert(bookVO);
		return "redirect:/write/home";
	}
	
	@RequestMapping(value = "/{isbn}/b-detail", method = RequestMethod.GET)
	public String bookDetail(Model model, @PathVariable("isbn")String b_isbn) {
		BookVO bookVO = bookService.findById(b_isbn);
		model.addAttribute("book", bookVO);
		return "/write/b-insert";
	}
	//PathVariable 은 value 값에 VO 에서 만든 값이 아닌 다른 값을 넣고싶을 때 사용하는 것이다.
	
	
	
	
	
	
	
	
}
