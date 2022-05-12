package com.bbt.toclass.board.service;

import com.bbt.toclass.board.dao.BoardDAO;
import com.bbt.toclass.board.vo.ArticleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;
import java.util.Map;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;

	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList =  boardDAO.selectAllArticlesList();

        return articlesList;
	}

	@Override
	public int articleCount() throws Exception {
		return boardDAO.articleCount();
	}

	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		return boardDAO.insertNewArticle(articleMap);
	}


	@Override
	public ArticleVO viewArticle(int articleNO) throws Exception {

		boardDAO.addViews(articleNO);
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}
	public ArticleVO bad(int articleNO) throws Exception {

		boardDAO.bad(articleNO);
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}
	public ArticleVO good(int articleNO) throws Exception {

		boardDAO.good(articleNO);
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}

	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}

	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}

	static void incrementNttRdCnt(String nttId) {

	}

}
