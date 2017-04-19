/**
 * 
 */
var AjaxTeam = (function() {
	var baseurl_pc = '/wxkf/capi/'; //pc中的Action
	var baseurl_wxkf = '/wxkf/capi/'; //pc中的Action
	function ajax_pc(url, data, fn,_async) {
		_async=typeof(_async)=="undefined"||typeof(_async)!="boolean"?true:_async;
		$.ajax({
			url : baseurl_pc + url,
			type : "POST",
			data : data,
			async:_async,
			success : function(data) {
				fn(data);
			}
		})
	}
	function ajax_wxkf(url, data, fn,_async) {
		_async=typeof(_async)=="undefined"||typeof(_async)!="boolean"?true:_async;
		$.ajax({
			url : baseurl_wxkf + url,
			type : "POST",
			data : data,
			async:_async,
			success : function(data) {
				fn(data);
			}
		})
	}
	function CompanyInfo(openid) {
		var dataJson={};
		ajax_pc('CompanyInfo_query', {
			"companyinfo.openid" : openid
		}, function(data) {
			dataJson = data;
		},false)
		return dataJson;
	}
	function getJobs(){
		ajax('CompanyInfo_query', {
			"companyinfo.openid" : openid
		}, function(data) {
			dataJson = data;
		},false)
		return dataJson;
	}
	return {
		//查询单个公司信息
		CompanyInfo : CompanyInfo
	}
})()