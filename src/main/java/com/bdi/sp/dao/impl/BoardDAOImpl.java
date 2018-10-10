package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.BoardDAO;
import com.bdi.sp.vo.BoardInfo;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<BoardInfo> getBoardInfoList(BoardInfo bi) {
		return ss.selectList("SQL.BOARD.selectBoardInfoList",bi);
	}
	@Override
	public int deleteBoardInfo(int binum) {
		return ss.delete("SQL.BOARD.deleteBoardInfo", binum);
	}
	@Override
	public int updateBoardInfo(BoardInfo bi) {
		return ss.update("SQL.BOARD.updateBoardInfo", bi);
	}
	@Override
	public BoardInfo getBoardInfo(int binum) {
		return ss.selectOne("SQL.BOARD.selectBoardInfo", binum);
	}
	@Override
	public int insertBoardInfo(BoardInfo bi) {
		return ss.insert("SQL.BOARD.insertBoardInfo",bi);
	}

}
