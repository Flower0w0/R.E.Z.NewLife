/* 動態設置過渡 */
var addTransition = function (ele) {
    ele.style.transition = "all .6s";
    ele.style.webkitTransition = "all .6s";
   };
   /* 移除過渡效果 */
   var removeTransition = function (ele) {
    ele.style.transition = "none";
    ele.style.webkitTransition = "none";
   };
   /* 設置容器平移 -- 也就是滑動動畫 
    ele:當前元素
    xwidth:平移的距離
   */
   var setTranslateX = function (ele, xwidth) {
    ele.style.transform = "translateX(" + xwidth + "px)";
    ele.style.webkitTransform = "translateX(" + xwidth + "px)";
   }

   var banner = function () {
    /** 輪播圖分析 */
    /** 1 自動輪播且無縫 [定時器、過渡動畫]
     * 2 點要隨著圖片的輪播而改變 [根據索引切換]
     * 3 滑動效果 [touch事件]
     * 4 圖片隨著點而變化
     * 5 滑動結束的時候，如果滑動的距離不超過屏幕的1/3，就恢復回去 [過渡]
     * 6 滑動結束的時候，如果滑動的距離超過屏幕的1/3，就切換 [滑動方向 + 過渡]]
     */
    var timer = ''
    /* 封裝定時器函數 */
    var startInterval = function () {
     timer = setInterval(function () {
      index++;// 基於索引 做位移
      addTransition(imgBox); // 為輪播圖片組的ul設置過渡函數
      setTranslateX(imgBox, -index * width);// 根據當前索引值計算平移的距離
     }, 2000);
    }
    var banner = document.querySelector(".jd_banner");
    var width = banner.offsetWidth; // 屏幕的寬度
    var imgBox = banner.querySelector("ul:first-child"); // 輪播圖片ul
    var length = imgBox.querySelectorAll("li").length; // 圖片的個數
    var pointBox = banner.querySelector("ul:last-child");// 分頁器ul
    var points = pointBox.querySelectorAll("li");// 分頁器集合
   
    var index = 1; // 初始化索引，由於要無縫銜接，索引從1開始
    startInterval();
    
    /* transitionend事件：當元素過渡動畫結束後執行
    每次輪播動畫結束後，判斷當前索引值
    */
    imgBox.addEventListener("transitionend", function () {
     if (index >= length - 1) {
      index = 1;
      // 清過渡，瞬間定位imgBox 
      removeTransition(imgBox);
      setTranslateX(imgBox, -index * width);
     }
     // 滑動的時候也需要無縫
     else if (index <= 0) {
      index = 8;
      removeTransition(imgBox);
      setTranslateX(imgBox, -index * width);
     }
     showPoint(index - 1); // 改變分頁器狀態
    });
   
    var showPoint = function (index) {
     for (var i = 0; i < points.length; i++) {
      points[i].className = '';
     }
     points[index].className = "now";
    };
    /* 滑動切換 (touch事件) */
    var startX = 0; // 觸摸起始點
    imgBox.addEventListener("touchstart", function (e) {
     // 記錄起始位置的X坐標
     clearInterval(timer);
     startX = e.touches[0].clientX;
    });
    var distanceX = 0;
    var translateX = 0;
    // **** 加一個標識，判斷用戶有沒有滑動
    var isMove = false
    imgBox.addEventListener("touchmove", function (e) {
     var moveX = e.touches[0].clientX;
     // 計算位移,有正負方向
     distanceX = moveX - startX;
     // 計算目標元素的位移
     // 元素將要的定位 = 當前定位 + 手指移動的距離
     translateX = -index * width + distanceX;
     // ********** 要想圖片實時地跟著手指走，一定要把過渡清楚掉
     removeTransition(imgBox)
     setTranslateX(imgBox, translateX);
     isMove = true;// 確定用戶有滑動
     e.preventDefault(); // 去除移動端瀏覽器默認的滑動事件
    });
   
    imgBox.addEventListener("touchend", function (e) {
     if (isMove) {
      if (Math.abs(distanceX) > width / 3) {
       // 切換
       if (distanceX > 0) {
        // 上一張
        index = index - 1;
       } else {
        // 下一張
        index = index + 1;
       }
       addTransition(imgBox); // 設置過渡動畫
       setTranslateX(imgBox, -index * width);
       if (index >= 9) {
        index = 1;
       }
       if (index <= 0) {
        index = 8;
       }
       showPoint(index - 1);
   
      } else {
       // 不滿足滑動條件，回退到之前的狀態
       addTransition(imgBox);
       setTranslateX(imgBox, -index * width);
       showPoint(index - 1);
      }
     }
     // **** 最好做一次參數的重置
     startX = 0;
     distanceX = 0;
     isMove = false;
     // ****** 為瞭嚴謹，再清一次定時器
     clearInterval(timer)
     // 加上定時器
     startInterval();
    });
   };