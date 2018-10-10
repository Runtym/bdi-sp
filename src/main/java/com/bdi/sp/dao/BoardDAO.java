package com.bdi.sp.dao;

import java.util.List;

import com.bdi.sp.vo.BoardInfo;

public interface BoardDAO {

	public List<BoardInfo> getBoardInfoList(BoardInfo bi);
	
	public int deleteBoardInfo(int binum);
	
	public int updateBoardInfo(BoardInfo bi);

	public BoardInfo getBoardInfo(int binum);

	public int insertBoardInfo(BoardInfo bi);
}
