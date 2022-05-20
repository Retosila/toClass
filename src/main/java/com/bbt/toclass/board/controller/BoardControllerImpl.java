package com.bbt.toclass.board.controller;

import com.bbt.toclass.board.service.BoardService;
import com.bbt.toclass.board.vo.ArticleVO;
import com.bbt.toclass.board.vo.NoticeVO;
import com.bbt.toclass.member.vo.MemberVO;
import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;



@Controller("boardController")
public class BoardControllerImpl  implements BoardController{

	private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);

	private static final String ARTICLE_IMAGE_REPO = "D:\\board\\article_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;


	// 알림장(교사)
	@RequestMapping(value = {"/board/notice_teacher"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice_teacher(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("notice_teacher 페이지 요청");
		ModelAndView mav = new ModelAndView("/board/notice_teacher");

		MemberVO mvo = (MemberVO)session.getAttribute("member");
		String teacherEmail = mvo.getMember_email();

		// 수신자 선택 드롭다운 리스트에 넣을 학생 목록 정보 바인딩
		logger.info("비즈니스 로직 요청 : getStudentInfo");
		List<MemberVO> studentList = boardService.getStudentInfo(teacherEmail);
		logger.info("비즈니스 로직 요청 성공");
		mav.addObject("studentList", studentList);

		return mav;
	}

	// 알림장(학생)
	@RequestMapping(value = {"/board/notice_student"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice_student(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("notice_student 페이지 요청");
		ModelAndView mav = new ModelAndView("/board/notice_student");

		MemberVO mvo = (MemberVO)session.getAttribute("member");
		String studentEmail = mvo.getMember_email();

		// 가장 최근에 받은 알림장 정보 바인딩
		logger.info("비즈니스 로직 요청 : getRecentNotice");
		NoticeVO recentNotice = boardService.getRecentNotice(studentEmail);
		logger.info("비즈니스 로직 요청 성공");
		mav.addObject("recentNotice", recentNotice);

		return mav;
	}


	/*
	 *
	 *
	 * 로직 요청 (*.do)
	 *
	 *
	 */





	@RequestMapping(value = "/board/sendNotice.do", method = {RequestMethod.POST})
	public ModelAndView sendNoticeDO(@ModelAttribute NoticeVO nvo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/notice_teacher");

		logger.info("controller : 알림 보내기 요청 수신");
		logger.info("요청 정보 parsing...");

		logger.info("제목 : " + nvo.getNotice_title());
		logger.info("수신자 이메일 : " + nvo.getNotice_receiver());
		logger.info("수신자 이름 : " + nvo.getNotice_receiver_name());
		logger.info("발신자 : " + nvo.getNotice_sender());
		logger.info("내용 : " + nvo.getNotice_content());

		logger.info("controller : sendNotice 메소드 실행");
		int result = boardService.sendNotice(nvo);

		return mav;
	}




























	/*
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 */









	@Override
	@RequestMapping(value={"/board/listArticles.do"}, method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String)request.getAttribute("viewName");

		List articlesList = boardService.listArticles();

		System.out.println(viewName);

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("articlesList", articlesList);

		return mav;

	}


	@Override
	@RequestMapping(value="/board/addNewArticle.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,
	HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		logger.info("글쓰기 요청");
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String member_name = memberVO.getMember_name();
		articleMap.put("parentNO", 0);
		articleMap.put("member_name", member_name);
		articleMap.put("imageFileName", imageFileName);

		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = boardService.addNewArticle(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				logger.info("threshold3");
				File srcFile = new
				File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				logger.info("threshold4");
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}

			message = "<script>";
			message += " alert('게시글이 등록되었습니다');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();

			message = " <script>";
			message +=" alert('오류');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}



	@RequestMapping(value="/board/viewArticle.do" ,method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{

		String viewName = (String)request.getAttribute("viewName");
		articleVO=boardService.viewArticle(articleNO);
		List articlesList = boardService.listArticles();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", articleVO);
		mav.addObject("articlesList", articlesList);
		System.out.printf(String.valueOf(mav));
		return mav;
	}
	@RequestMapping(value="/board/modArticleForm" ,method = RequestMethod.GET)
	public ModelAndView modArticleForm(@RequestParam("articleNO") int articleNO,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
		articleVO=boardService.viewArticle(articleNO);
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", articleVO);
		return mav;
	}

	@RequestMapping(value="/board/bad.do" ,method = RequestMethod.GET)
	public ModelAndView bad(@RequestParam("articleNO") int articleNO,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
		articleVO=boardService.bad(articleNO);

		List articlesList = boardService.listArticles();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/viewArticle");
		mav.addObject("articlesList", articlesList);
		mav.addObject("article", articleVO);
		return mav;
	}
	@RequestMapping(value="/board/good.do" ,method = RequestMethod.GET)
	public ModelAndView good(@RequestParam("articleNO") int articleNO,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
		articleVO=boardService.good(articleNO);

		List articlesList = boardService.listArticles();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/viewArticle");
		mav.addObject("articlesList", articlesList);
		mav.addObject("article", articleVO);
		return mav;
	}



  @RequestMapping(value="/board/modArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,
    HttpServletResponse response) throws Exception{
    multipartRequest.setCharacterEncoding("utf-8");
	Map<String,Object> articleMap = new HashMap<String, Object>();
	Enumeration enu=multipartRequest.getParameterNames();
	while(enu.hasMoreElements()){
		String name=(String)enu.nextElement();
		String value=multipartRequest.getParameter(name);
		articleMap.put(name,value);
	}

	String imageFileName= upload(multipartRequest);
	HttpSession session = multipartRequest.getSession();
	MemberVO memberVO = (MemberVO) session.getAttribute("member");
	String member_name = memberVO.getMember_name();
	articleMap.put("name", member_name);
	articleMap.put("imageFileName", imageFileName);

	String articleNO=(String)articleMap.get("articleNO");
	String message;
	ResponseEntity resEnt=null;
	HttpHeaders responseHeaders = new HttpHeaders();
	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
    try {
       boardService.modArticle(articleMap);
       if(imageFileName!=null && imageFileName.length()!=0) {
         File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
         File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
         FileUtils.moveFileToDirectory(srcFile, destDir, true);

         String originalFileName = (String)articleMap.get("originalFileName");
         File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO+"\\"+originalFileName);
         oldFile.delete();
       }
       message = "<script>";
	   message += " alert('수정.');";
	   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
	   message +=" </script>";
       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }catch(Exception e) {
      File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
      srcFile.delete();
      message = "<script>";
	  message += " alert('수정실패');";
	  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
	  message +=" </script>";
      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }
    return resEnt;
  }
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}

		return jsonObject;
	}

  @Override
  @RequestMapping(value="/board/removeArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity  removeArticle(@RequestParam("articleNO") int articleNO,
                              HttpServletRequest request, HttpServletResponse response) throws Exception{
	response.setContentType("text/html; charset=UTF-8");
	String message;
	ResponseEntity resEnt=null;
	HttpHeaders responseHeaders = new HttpHeaders();
	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	try {
		boardService.removeArticle(articleNO);
		File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
		FileUtils.deleteDirectory(destDir);

		message = "<script>";
		message += " alert('삭제되었습니다.');";
		message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

	}catch(Exception e) {
		message = "<script>";
		message += " alert('삭제실패.');";
		message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    e.printStackTrace();
	}
	return resEnt;
  }
  @RequestMapping(value = "/board/articleForm.do", method =  RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {

	ModelAndView mav = new ModelAndView();
	mav.setViewName("/board/articleForm");
	return mav;
}

  	// 미구현 페이지 임시 매핑용
	@RequestMapping(value={"/board/undefined"}, method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView temp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/listArticles");
		return mav;
	}





	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //��λ� ������ �������� ���� ���
					if(file.getParentFile().mkdirs()){ //��ο� �ش��ϴ� ���丮���� ����
							file.createNewFile(); //���� ���� ����
					}
				}
				mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
			}
		}
		return imageFileName;
	}
	// 알림장(교사)





}
