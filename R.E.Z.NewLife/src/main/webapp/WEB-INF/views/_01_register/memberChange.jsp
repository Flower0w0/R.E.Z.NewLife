<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="./css/main.css"> -->
<!-- <link rel="stylesheet" href="./css/product.css"> -->
<link rel="stylesheet" href="<c:url value='/css/personchange.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css.map' />">
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/text.css' />">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<style>
.float {
	float: left;
	width: 200px;
	height: 200px;
	overflow: hidden;
	border: 1px solid #CCCCCC;
	border-radius: 10px;
	padding: 5px;
	margin: 5px;
}

img {
	position: relative;
}

.result {
	width: 200px;
	height: 200px;
	text-align: center;
	box-sizing: border-box;
}

.delete {
	width: 200px;
	height: 200px;
	position: absolute;
	text-align: center;
	line-height: 200px;
	z-index: 10;
	font-size: 30px;
	background-color: rgba(255, 255, 255, 0.8);
	color: #777;
	opacity: 0;
	transition-duration: 0.7s;
	-webkit-transition-duration: 0.7s;
}

.delete:hover {
	cursor: pointer;
	opacity: 1;
}
</style>

<style>
input, textarea {
	caret-color: auto; /* 預設 */
	caret-color: transparent; /* 透明 */
	caret-color: #FF1744; /* 指定色 */
	outline: none; /* 外框效果 */
}
</style>

<body background="<c:url value='/images/bg/repeated-square.png' />">

	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />


				<!-- 會員資料 -->
				<div class="container_1">
					<div class="member_content"
						style="text-align: center; align-items: center; grid-template-rows: repeat(40, minmax(0px, auto)); row-gap: 10px;">
						<div class="_2w2H6X"
							style="grid-row: 1/2; grid-column: 1/5; text-align: start;">
							<h3 class="_3iiDCN">
								交換心願
								<button class="btn buttoncss" type="button"
									style="float: right;" data-bs-toggle="collapse"
									data-bs-target="#collapseExample1" aria-expanded="false"
									aria-controls="collapseExample">心願列表</button>
							</h3>
						</div>
						<div class="collapse" id="collapseExample1"
							style="grid-row: 2/3; grid-column: 1/5;">
							<div class="card card-body"
								style="background-color: transparent;">
								<table class="table">
									<thead>
										<tr>
											<th scope="col" style="width: 85%; text-align: left;">標題</th>
											<th scope="col" style="text-align: right;">
												<button class="btn buttoncss" type="button"
													data-bs-toggle="collapse" data-bs-target="#collapseExample"
													aria-expanded="false" aria-controls="collapseExample">撰寫心願</button>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">
												<div class="collapse" id="collapseExample">
													<div class="card card-body"
														style="grid-row: 1/2; grid-column: 1/5; background-color: transparent;">
														<form>
															<input type="text" style="width: 100%;"
																placeholder="心願標題">
															<hr>
															<textarea style="width: 100%; height: 100px;"
																placeholder="心願內容"></textarea>
															<hr>
															<div class="container_5">
																<p style="text-align: left;">
																	<label>請依序上傳遊戲盒正面及遊戲片正反面：</label> <input
																		style="width: 200px; vertical-align: right;"
																		type="file"
																		accept="image/gif,image/png,image/jpeg,image/jpg"
																		id="file_input" multiple /><input
																		style="float: right;" class="buttoncss" type="submit"
																		value="提交"> <span
																		style="float: right; color: crimson; margin-right: 5px;">※照片請依序上傳</span>
																</p>
															</div>
															<div class="pic">
																<ul>
																</ul>
															</div>
														</form>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td style="text-align: left; vertical-align: middle;">心願標題</td>
											<td style="text-align: right;">
												<button class="btn buttoncss" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapseExample6" aria-expanded="false"
													aria-controls="collapseExample">查看</button>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="collapse" id="collapseExample6">
													<div class="card card-body" style="text-align: left;"
														style="background-color: transparent;">
														<form>
															<input type="text" style="width: 75%;" placeholder="心願標題">
															<div style="float: right;">
																<input type="checkbox" value="已交換" /> 已交換 <input
																	type="checkbox" value="待交換" /> 待交換
															</div>
															<hr>
															<textarea style="width: 100%; height: 100px;"
																placeholder="心願內容"></textarea>
															<hr>
															<div class="container_5">
																<p style="text-align: left;">
																	<label>請依序上傳遊戲盒正面及遊戲片正反面：</label> <input
																		style="width: 200px; vertical-align: right;"
																		type="file"
																		accept="image/gif,image/png,image/jpeg,image/jpg"
																		id="file_input" multiple /><input
																		style="float: right; margin-left: 2px;"
																		class="buttoncss" type="submit" value="刪除"> <input
																		style="float: right;" class="buttoncss" type="submit"
																		value="儲存"> <span
																		style="float: right; color: crimson; margin-right: 5px;">※照片請依序上傳</span>
																</p>
															</div>
															<div class="pic">
																<ul>
																</ul>
															</div>
														</form>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 							<span>交換心願狀態</span><span>品項名稱</span><span></span> -->

						<!-- 第一列收藏           -->
						<div class="detail" style="grid-row: 3/4; grid-column: 1/2;">
							<span>已交換</span>
						</div>
						<div class="detail"
							style="grid-row: 3/4; grid-column: 2/3; text-align: start;">
							<span>地獄廚房 煮過頭 1+2 合輯 Overcooked 中英文版全新</span>
						</div>
						<div class="detail" style="grid-row: 3/4; grid-column: 3/4;">
							<span><a href="<c:url value='/_03_raiders/wishContent' />">
									<button style="margin-right: 5px;" type="button"
										class="btn buttoncss">前往許願池</button>
							</a>
								<button type="button" class="btn buttoncss">取消追蹤</button></span>
						</div>
						<!-- 第二列收藏 -->
						<div class="detail" style="grid-row: 4/5; grid-column: 1/2;">
							<span>待交換</span>
						</div>
						<div class="detail"
							style="grid-row: 4/5; grid-column: 2/3; text-align: start;">
							<span>PS4 魔物獵人世界 Iceborne 本篇+超大型擴充內容 中文版全新</span>
						</div>
						<div class="detail" style="grid-row: 4/5; grid-column: 3/4;">
							<span><a href="<c:url value='/_03_raiders/wishContent' />">
									<button style="margin-right: 5px;" type="button"
										class="btn buttoncss">前往許願池</button>
							</a>
								<button type="button" class="btn buttoncss">取消追蹤</button></span>
						</div>
						<!-- 第三列收藏 -->
						<div class="detail" style="grid-row: 5/6; grid-column: 1/2;">
							<span>待交換</span>
						</div>
						<div class="detail"
							style="grid-row: 5/6; grid-column: 2/3; text-align: start;">
							<span>【NS】瑪利歐＆索尼克 AT 東京奧運《中文版》</span>
						</div>
						<div class="detail" style="grid-row: 5/6; grid-column: 3/4;">
							<span><a href="<c:url value='/_03_raiders/wishContent' />">
									<button style="margin-right: 5px;" type="button"
										class="btn buttoncss">前往許願池</button>
							</a>
								<button type="button" class="btn buttoncss">取消追蹤</button></span>
						</div>
					</div>
					<!-- 左側欄 -->
					<jsp:include page="/fragment/sideMenu.jsp" />

				</div>
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

	<script type="text/javascript">

	window.onload = function(){ var input =
	document.getElementById("file_input"); var result,fd,dataArr = [];
	if(typeof FileReader==='undefined'){ alert("抱歉，你的瀏覽器不支持 FileReader");
	input.setAttribute('disabled','disabled'); }else{
	input.addEventListener('change',readFile,false); } function readFile(){
	fd = new FormData(); var iLen = this.files.length; for(var i=0;i
	<iLen ;i++){
                    if
		(!input['value'].match(/.jpg|.gif|.png|.jpeg|.bmp/i)){　　//判斷上傳文件格式
		return
		alert("上傳的圖片格式不正確，請重新選擇");
                    }
                    var
		reader=new
		FileReader();
                    fd.append(i,this.files[i]);
                    reader.readAsDataURL(this.files[i]);  //轉成base64
		reader.fileName=this.files[i].name; reader.onload=function(e){ var
		imgMsg={ name : this.fileName,//獲取文件名 base64 :
		this.result   //reader.readAsDataURL方法執行完后，base64數據儲存在reader.result里
                        }
                        dataArr.push(imgMsg);
                        result='<div class="delete">delete</div><div class="result"><img class="subPic" src="'+this.result+'" alt="'+this.fileName+'"/></div>'
		;
                        var div=document.createElement(
		'div');
                        div.innerHTML=result;
		div['className']='float'
		;
                        document.getElementsByTagName('ul')[0].appendChild(div);  　　//插入dom樹
		插入的位置!!!
                        var img=div.getElementsByTagName(
		'img')[0];
                        img.onload=function(){ var
		nowHeight=ReSizePic(this); //設置圖片大小
		this.parentNode.style.display='block'
		;
                            var oParent=this.parentNode;
		if(nowHeight){
                                oParent.style.paddingTop=(oParent.offsetHeight
		- nowHeight)/2 + 'px';
                            }
                        }
                        div.onclick=function(){
		$(this).remove();                  // 在頁面中刪除該圖片元素
                        }
                    }
                }
            }
         
         
            /*function
		send(){
                var submitArr=[]; $('.subPic').each(function
		() {
                        submitArr.push({
                            name: $(this).attr('alt'),
                            base64: $(this).attr('src')
                        });
                    }
                );
                $.ajax({
                    url
		: 'http://123.206.89.242:9999',
                    type
		: 'post',
                    data :
		JSON.stringify(submitArr),
                    dataType: 'json',
                    //processData:
		false,   用FormData傳fd時需有這兩項
                    //contentType:
		false,
                    success :
		function(data){
                        console.log('返回的數據：'+JSON.stringify(data))
                  　}
                })
            }*/
         
         
         
         
            /*oSelect.onclick=function(){
		oInput.value=""
		;   // 先將oInput值清空，否則選擇圖片與上次相同時change事件不會觸發
                //清空已選圖片
                $('.float').remove();
                oInput.click();
            }
         
         
            oAdd.onclick=function(){
		oInput.value="" ;   // 先將oInput值清空，否則選擇圖片與上次相同時change事件不會觸發
		oInput.click();
            }
         
         
            oSubmit.onclick=function(){
		if(!dataArr.length){
                    return
		alert('請先選擇文件');
                }
                send();
            }*/
        }
        /*
		用ajax發送fd參數時要告訴jQuery不要去處理發送的數據，
         不要去設置Content-Type請求頭才可以發送成功，否則會報“Illegal
		invocation”的錯誤，
         也就是非法調用，所以要加上“processData:
		false,contentType: false,”
         *
		*/
         
         
        function
		ReSizePic(ThisPic) {
            var RePicWidth=200; //這里修改為您想顯示的寬度值
		var TrueWidth=ThisPic.width; //圖片實際寬度 var TrueHeight=ThisPic.height;
		//圖片實際高度 if(TrueWidth>TrueHeight){ //寬大於高 var reWidth =
	RePicWidth; ThisPic.width = reWidth; //垂直居中 var nowHeight = TrueHeight
	* (reWidth/TrueWidth); return nowHeight; //將圖片修改后的高度返回，供垂直居中用 }else{
	//寬小於高 var reHeight = RePicWidth; ThisPic.height = reHeight; } } </script>
</body>

</html>