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
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/product.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css.map' />">
<link rel="stylesheet" href="<c:url value='/css/text.css' />">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
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

.pic {
	/* background-color: aqua;  */
	border: 2px solid #bdc2bf;
	height: 40%;
	width: 100%;
}
</style>

<body background="<c:url value='/images/bg/repeated-square.png' />">

	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />
				<!-- 整個框 -->
				<div class="container_1">
					<!-- 收購資料 -->
					<div class="member_content">
						<div class="_2w2H6X">
							<h3 class="_3iiDCN">
								新生收購
								<button class="btn buttoncss" type="button"
									style="float: right;" data-bs-toggle="collapse"
									data-bs-target="#collapseExample" aria-expanded="false"
									aria-controls="collapseExample">新增收購</button>
							</h3>
						</div>
						<div>
							<div style="align-items: center;">
								<div class="collapse" id="collapseExample">
									<div class="card card-body"
										style="background-color: transparent;">
										<form>

											<div class="acq_brand" style="margin: 3% 0 3% 0;">
												<div class="input-group mb-3" style="width: 100%">
													<label class="input-group-text" for="inputGroupSelect01">遊戲名稱</label>
													<select class="form-select" id="inputGroupSelect01">
														<option selected>請選擇</option>
														<option value="1">${produt.name}</option>
														<option value="2">【NS】舞力全開 2021 Just Dance.
															2021《中文版》</option>
													</select>
												</div>
											</div>

											<div class="acq_name" style="margin: 3% 0 3% 0;">
												<div class="input-group mb-3" style="width: 100%">
													<label class="input-group-text" for="inputGroupSelect01">遊戲品牌</label>
													<select class="form-select" id="inputGroupSelect01">
														<option selected>請選擇</option>
														<option value="1">Nintendo</option>
														<option value="2">PlayStation</option>
													</select>
												</div>
											</div>

											<!-- 傳照片 -->
											<div class="container_5">
												<p>
													<label>請依序上傳遊戲盒正面及遊戲片正反面：</label> <input
														style="width: 200px; vertical-align: right;" type="file"
														accept="image/gif,image/png,image/jpeg,image/jpg"
														id="file_input" multiple /> <input style="float: right;"
														class="buttoncss" type="submit" value="提交"> <span
														style="float: right; color: crimson; margin-right: 5px;">※照片請依序上傳</span>
												</p>
											</div>
											<div>
												<ul>
													<!-- <li>
                    <div class="pic_cover">
                        <img src="./images/longlogo-cut.png" alt="123">
                        <span class="close"></span>
                    </div>
                </li> -->
												</ul>
											</div>
											<!-- 						<div class="con_bt"> -->
											<!-- 							<div class="d-grid gap-2 d-md-flex justify-content-md-end" -->
											<!-- 								style="width: 100%; margin-top: 3%;"> -->
											<!-- 								<span style="margin-top: 1%; color: crimson;">※照片請依序上傳</span> -->
											<!-- 								<button class="btn btn-primary me-md-2 buttoncss" type="button">確認</button> -->
											<!-- 								<button class="btn btn-primary buttoncss" type="button">取消</button> -->
											<!-- 							</div> -->
											<!-- 						</div> -->

										</form>
									</div>
								</div>
							</div>
						</div>
						<br>
						<table class="table"
							style="vertical-align: middle; text-align: center;">
							<thead>
								<tr>
									<th scope="col" style="width: 12%;">審核結果</th>
									<th scope="col" style="width: 12%;">遊戲品牌</th>
									<th scope="col" style="text-align: left;">遊戲名稱</th>
									<th scope="col" style="width: 12%;">收購價格</th>
									<th scope="col" style="width: 12%;">成立時間</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>審核中</td>
									<td>NS</td>
									<td style="text-align: left;">魔物獵人</td>
									<td>500</td>
									<td>2021.09.06</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>審核中</td>
									<td>NS</td>
									<td style="text-align: left;">魔物獵人</td>
									<td>500</td>
									<td>2021.09.06</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>審核中</td>
									<td>NS</td>
									<td style="text-align: left;">魔物獵人</td>
									<td>500</td>
									<td>2021.09.06</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 左側欄 -->
						<jsp:include page="/fragment/sideMenu.jsp" />
				</div>
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->

	<script type="text/javascript">

        window.onload = function(){
            var input = document.getElementById("file_input");
            var result,fd,dataArr = [];
            if(typeof FileReader==='undefined'){
                alert("抱歉，你的瀏覽器不支持 FileReader");
                input.setAttribute('disabled','disabled');
            }else{
                input.addEventListener('change',readFile,false);
            }
         
         
            function readFile(){
                fd = new FormData();
                var iLen = this.files.length;
                for(var i=0;i<iLen;i++){
                    if (!input['value'].match(/.jpg|.gif|.png|.jpeg|.bmp/i)){　　//判斷上傳文件格式
                        return alert("上傳的圖片格式不正確，請重新選擇");
                    }
                    var reader = new FileReader();
                    fd.append(i,this.files[i]);
                    reader.readAsDataURL(this.files[i]);  //轉成base64
                    reader.fileName = this.files[i].name;
         
                    reader.onload = function(e){
                        var imgMsg = {
                            name : this.fileName,//獲取文件名
                            base64 : this.result   //reader.readAsDataURL方法執行完后，base64數據儲存在reader.result里
                        }
                        dataArr.push(imgMsg);
                        result = '<div class="delete">delete</div><div class="result"><img class="subPic" src="'+this.result+'" alt="'+this.fileName+'"/></div>';
                        var div = document.createElement('div');
                        div.innerHTML = result;
                        div['className'] = 'float';
                        document.getElementsByTagName('ul')[0].appendChild(div);  　　//插入dom樹  插入的位置!!!
                        var img = div.getElementsByTagName('img')[0];
                        img.onload = function(){
                            var nowHeight = ReSizePic(this); //設置圖片大小
                            this.parentNode.style.display = 'block';
                            var oParent = this.parentNode;
                            if(nowHeight){
                                oParent.style.paddingTop = (oParent.offsetHeight - nowHeight)/2 + 'px';
                            }
                        }
                        div.onclick = function(){
                            $(this).remove();                  // 在頁面中刪除該圖片元素
                        }
                    }
                }
            }
         
         
            /*function send(){
                var submitArr = [];
                $('.subPic').each(function () {
                        submitArr.push({
                            name: $(this).attr('alt'),
                            base64: $(this).attr('src')
                        });
                    }
                );
                $.ajax({
                    url : 'http://123.206.89.242:9999',
                    type : 'post',
                    data : JSON.stringify(submitArr),
                    dataType: 'json',
                    //processData: false,   用FormData傳fd時需有這兩項
                    //contentType: false,
                    success : function(data){
                        console.log('返回的數據：'+JSON.stringify(data))
                  　}
                })
            }*/
         
         
         
         
            /*oSelect.onclick=function(){
                oInput.value = "";   // 先將oInput值清空，否則選擇圖片與上次相同時change事件不會觸發
                //清空已選圖片
                $('.float').remove();
                oInput.click();
            }
         
         
            oAdd.onclick=function(){
                oInput.value = "";   // 先將oInput值清空，否則選擇圖片與上次相同時change事件不會觸發
                oInput.click();
            }
         
         
            oSubmit.onclick=function(){
                if(!dataArr.length){
                    return alert('請先選擇文件');
                }
                send();
            }*/
        }
        /*
         用ajax發送fd參數時要告訴jQuery不要去處理發送的數據，
         不要去設置Content-Type請求頭才可以發送成功，否則會報“Illegal invocation”的錯誤，
         也就是非法調用，所以要加上“processData: false,contentType: false,”
         * */
         
         
        function ReSizePic(ThisPic) {
            var RePicWidth = 200; //這里修改為您想顯示的寬度值
         
            var TrueWidth = ThisPic.width; //圖片實際寬度
            var TrueHeight = ThisPic.height; //圖片實際高度
         
            if(TrueWidth>TrueHeight){
                //寬大於高
                var reWidth = RePicWidth;
                ThisPic.width = reWidth;
                //垂直居中
                var nowHeight = TrueHeight * (reWidth/TrueWidth);
                return nowHeight;  //將圖片修改后的高度返回，供垂直居中用
            }else{
                //寬小於高
                var reHeight = RePicWidth;
                ThisPic.height = reHeight;
            }
        }

</script>
</body>

</html>