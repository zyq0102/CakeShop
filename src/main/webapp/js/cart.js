
/**
 * 加入购物车
 * $.get $.post $.ajax
 */
function buy(goodid){
    //      请求路径          请求参数                    请求的响应事件-函数
	$.post("goods_buy", {goodsid:goodid,action:"add"}, function(data){
		if(data=="ok")
		{
		    //提示信息小弹窗 layer函数调用的layer.js
			layer.msg("添加到购物车!", {time:800}, function(){
               location.reload();
            });
		}
		else if(data=="fail")
		{
            layer.msg("库存不足,请购买其他商品!", {time:800}, function(){

            });
		}
		/*if(data=="ok"){
			layer.msg("操作成功!", {time:800}, function(){
				location.reload();
			});
		}else if(data=="login"){
			alert("请登录后购买!");
			location.href="login.jsp";
		}else if(data=="empty"){
			alert("库存不足!");
			location.reload();
		}else{
			alert("请求失败!");
		}*/

	});
}

function lessen(goodsid){
    $.post("goods_buy", {goodsid:goodsid,action:"lessen"}, function(data){
        if(data=="ok"){
            layer.msg("操作成功!", {time:800}, function(){
                location.reload();
            });
        }
//		if(data=="ok"){
//			layer.msg("操作成功!", {time:800}, function(){
//				location.href="cart.action";
//			});
//		}else if(data=="login"){
//			alert("请登录后操作!");
//			location.href="login.jsp";
//		}else{
//			alert("请求失败!");
//		}
    });
}
/**
 * 购物车删除
 */
function deletes(goodid){
    $.post("goods_buy", {goodsid:goodid,action:"delete"}, function(data){
        if(data=="ok"){
            layer.msg("删除成功!", {time:800}, function(){
                location.reload();
            });
        }
    });
}