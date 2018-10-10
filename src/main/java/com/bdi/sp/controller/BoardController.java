package com.bdi.sp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.dao.BoardDAO;
import com.bdi.sp.vo.BoardInfo;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO bdao;

	@RequestMapping(value="/board",method=RequestMethod.GET)
	public @ResponseBody List<BoardInfo> boardList(@ModelAttribute BoardInfo jp) {
		return bdao.getBoardInfoList(jp);
	}
	
	@RequestMapping(value="/board/{binum}", method=RequestMethod.GET)
	public @ResponseBody BoardInfo board(@PathVariable int binum) {
		return bdao.getBoardInfo(binum);
	}
	@RequestMapping(value="/board",method=RequestMethod.PUT)
	public @ResponseBody String  updateBoardInfo(@RequestBody BoardInfo bi) {
		return bdao.updateBoardInfo(bi) + "";
	}
	@RequestMapping(value="/board",method=RequestMethod.POST)
	public @ResponseBody String  insertBoardInfo(@RequestBody BoardInfo bi) {
		return bdao.insertBoardInfo(bi) + "";
	}
	@RequestMapping(value="/board/{binum}",method=RequestMethod.DELETE)
	public @ResponseBody String deleteBoardInfo(@PathVariable int binum) {
		return bdao.deleteBoardInfo(binum) +"";
	}
	
}
