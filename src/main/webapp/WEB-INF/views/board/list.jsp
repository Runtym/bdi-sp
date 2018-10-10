<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<script>
window.addEventListener('load',function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/board');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for(var bi of res){
					html += '<tr>';
					html += '<td>' + bi.binum + '</td>';
					html += '<td><input type="text" name="bititle' + bi.binum + '" value="' + bi.bititle + '"></td>';
					html += '<td><input type="text" name="bitext' + bi.binum + '" value="' + bi.bitext + '"></td>';
					html += '<td><input type="text" name="bifile' + bi.binum + '" value="' + bi.bifile + '"></td>';
					html += '<td><input type="text" name="bicredat' + bi.binum + '" value="' + bi.bicredat + '"></td>';
					html += '<td><input type="text" name="bimoddat' + bi.binum + '" value="' + bi.bimoddat + '"></td>';
					html += '<td><input type="text" name="bicnt' + bi.binum + '" value="' + bi.bicnt + '"></td>';
					html += '<td><input type="text" name="biactive' + bi.binum + '" value="' + bi.biactive + '"></td>';
					html += '<td><input type="text" name="uinum' + bi.binum + '" value="' + bi.uinum + '"></td>';
					html += '<td><input type="text" name="bitest' + bi.binum + '" value="' + bi.bitest + '"></td>';
					html += '<td><button onclick="boardUpdate('+bi.binum+')">수정</button>';
					html += ' <button onclick="boardDelete('+bi.binum+')">삭제</button></td>';
					html += '</tr>';
				}

				document.querySelector('#jpBody').insertAdjacentHTML('beforeend',html);
			}else{
				
			}
		}
	}
	xhr.send();
});
</script>
<body>
<table border="1">
	<thead>
		<tr> 
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>파일</th>
			<th>등록일</th>
			<th>수정일</th>
			<th>조회수</th>
			<th>삭제여부</th>
			<th>게시자</th>
			<th>비고</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody id="jpBody">
	</tbody>
</table>
<button onclick="boardAdd()">재팬추가</button>
<script>
	function boardUpdate(binum){
		var bititle = document.querySelector('input[name=bititle' + binum + ']').value;
		var bitext = document.querySelector('input[name=bitext' + binum + ']').value;
		var param = {binum:binum,bititle:bititle,bitext:bitext};
		var xhr = new XMLHttpRequest();
		var url = "/board";
		xhr.open('PUT',url);
		xhr.setRequestHeader('Content-Type','application/json;charset=utf-8');
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('수정성공!')
						location.href='/uri/board/list';
					}
				}else{
					alert('수정실패');
				}
			}
		}
		xhr.send(JSON.stringify(param));
	}
	function boardDelete(binum){
		var xhr = new XMLHttpRequest();
		var url = "/board/" + binum;
		xhr.open('DELETE',url);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('삭제성공!')
						location.href='/board';
					}
				}else{
					alert('삭제실패');
				}
			}
		}
		xhr.send();
	}
	function boardAdd(){
		var html = '<tr>';
		html += '<td>&nbsp;</td>';
		html += '<td><input type="text" name="bititle" value=""></td>';
		html += '<td><input type="text" name="bitext" value=""></td>';
		html += '<td><input type="text" name="bifile" value=""></td>';
		html += '<td><input type="text" name="bicredat" value=""></td>';
		html += '<td><input type="text" name="bimoddat" value=""></td>';
		html += '<td><input type="text" name="bicnt" value=""></td>';
		html += '<td><input type="text" name="biactive" value=""></td>';
		html += '<td><input type="text" name="uinum" value=""></td>';
		html += '<td><input type="text" name="bitest" value=""></td>';
		html += '<td><button onclick="boardInsert()">저장</button></td>';
		html += '</tr>';
		document.querySelector('tbody').insertAdjacentHTML('beforeend',html);
		//document.querySelector('tbody').innerHTML += html;
	}
	
	function boardInsert(){
		var bititle = document.querySelector('input[name=bititle]').value;
		var bitext = document.querySelector('input[name=bitext]').value;
		//alert('수정 : ' + binum +jpname + jpdesc);
		var param = {bititle:bititle,bitext:bitext};
		var xhr = new XMLHttpRequest();
		var url = "/board";
		xhr.open('POST',url);
		xhr.setRequestHeader('Content-Type','application/json;charset=utf-8');
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					if(xhr.responseText=='1'){
						alert('저장성공!')
						location.href='/uri/board/list';
					}
				}else{
					alert('수정실패');
				}
			}
		}
		xhr.send(JSON.stringify(param));
	}
</script>
</body>
</html>