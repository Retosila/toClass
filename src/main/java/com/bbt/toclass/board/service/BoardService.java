package com.bbt.toclass.board.service;

import com.bbt.toclass.board.vo.ArticleVO;

import java.util.List;
import java.util.Map;

public interface BoardService {


	public List<ArticleVO> listArticles() throws Exception;
	public int articleCount() throws Exception;
	public int addNewArticle(Map articleMap) throws Exception;
	public ArticleVO viewArticle(int articleNO) throws Exception;
	//public Map viewArticle(int articleNO) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;
	public ArticleVO bad(int articleNO) throws Exception;
	public ArticleVO good(int articleNO) throws Exception;
}
