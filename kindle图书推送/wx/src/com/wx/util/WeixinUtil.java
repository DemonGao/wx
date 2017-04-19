package com.wx.util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.util.DBUtil;
import com.wx.menu.Button;
import com.wx.menu.ClickButton;
import com.wx.menu.Menu;
import com.wx.menu.ViewButton;
import com.wx.po.AccessToken;
import com.wx.po.OAccessToken;
import com.wx.po.UnionID;
import com.wx.trans.Data;
import com.wx.trans.Parts;
import com.wx.trans.Symbols;
import com.wx.trans.TransResult;

/**
 * 微锟脚癸拷锟斤拷锟斤拷
 * @author Stephen
 *
 */
public class WeixinUtil {
	private static final String APPID = "wxdca232ff0e9231cb";//"wx6c12dd6f27d264aa";//"wxdca232ff0e9231cb";
	private static final String APPSECRET = "cdac160a6a57459438a9e3a712a7c82b";//"a72448989562626f7537c479d00de1d6";//"cdac160a6a57459438a9e3a712a7c82b";
//	private static final String APPID = "wx6c12dd6f27d264aa";//"wx6c12dd6f27d264aa";//"wxdca232ff0e9231cb";
//	private static final String APPSECRET = "a72448989562626f7537c479d00de1d6";//"a72448989562626f7537c479d00de1d6";//"cdac160a6a57459438a9e3a712a7c82b";
	
	private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	
	private static final String UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	
	private static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	
	private static final String QUERY_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	
	private static final String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
	
	private static final String UNIONID_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
	private static final String OAUTH2_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	
//	//电子书城	url  要进行urlEncode 转码
//	private static final String HOME_REDIRECT_URI="http%3a%2f%2fdemongao94.tunnel.2bdata.com%2fwx%2fbook%2findex.jsp";
//	//邮箱绑定	url  要进行urlEncode 转码
//	private static final String EMAILBIND_REDIRECT_URI="http%3a%2f%2fdemongao94.tunnel.2bdata.com%2fwx%2fbook%2fpage%2fkindleBind.jsp";
//	//用户激活 url 
//	private static final String USERACTIVE_REDIRECT_URI="http%3a%2f%2fdemongao94.tunnel.2bdata.com%2fwx%2fbook%2fpage%2fuseractive.jsp";
	
	//电子书城	url  要进行urlEncode 转码
	private static final String HOME_REDIRECT_URI="http%3A%2F%2Fdemongao.com%2fwx%2fbook%2findex.jsp";
	//邮箱绑定	url  要进行urlEncode 转码
	private static final String EMAILBIND_REDIRECT_URI="http%3A%2F%2Fdemongao.com%2fwx%2fbook%2fpage%2fkindleBind.jsp";
	//用户激活 url 
	private static final String USERACTIVE_REDIRECT_URI="http%3A%2F%2Fdemongao.com%2fwx%2fbook%2fpage%2fuseractive.jsp";
		
	/**
	 * get请求
	 * @param url
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	public static JSONObject doGetStr(String url) throws ParseException, IOException{
		DefaultHttpClient client = new DefaultHttpClient();
		HttpGet httpGet = new HttpGet(url);
		JSONObject jsonObject = null;
		HttpResponse httpResponse = client.execute(httpGet);
		HttpEntity entity = httpResponse.getEntity();
		if(entity != null){
			String result = EntityUtils.toString(entity,"UTF-8");
			jsonObject = JSONObject.fromObject(result);
		}
		return jsonObject;
	}
	
	/**
	 * POST请求
	 * @param url
	 * @param outStr
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	public static JSONObject doPostStr(String url,String outStr) throws ParseException, IOException{
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost(url);
		JSONObject jsonObject = null;
		httpost.setEntity(new StringEntity(outStr,"UTF-8"));
		HttpResponse response = client.execute(httpost);
		String result = EntityUtils.toString(response.getEntity(),"UTF-8");
		jsonObject = JSONObject.fromObject(result);
		return jsonObject;
	}
	
	/**
	 * 文件上传
	 * @param filePath
	 * @param accessToken
	 * @param type
	 * @return
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchProviderException
	 * @throws KeyManagementException
	 */
	public static String upload(String filePath, String accessToken,String type) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException {
		File file = new File(filePath);
		if (!file.exists() || !file.isFile()) {
			throw new IOException("文件不存在");
		}

		String url = UPLOAD_URL.replace("ACCESS_TOKEN", accessToken).replace("TYPE",type);
		
		URL urlObj = new URL(url);
		//连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		con.setRequestMethod("POST"); 
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false); 

		//设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		//设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

		StringBuilder sb = new StringBuilder();
		sb.append("--");
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");

		byte[] head = sb.toString().getBytes("utf-8");

		//获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		//输出表头
		out.write(head);

		//文件正文部分
		//把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		//结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");//定义最后数据分隔线

		out.write(foot);

		out.flush();
		out.close();

		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		String result = null;
		try {
			//定义BufferedReader输入流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			if (result == null) {
				result = buffer.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				reader.close();
			}
		}

		JSONObject jsonObj = JSONObject.fromObject(result);
		System.out.println(jsonObj);
		String typeName = "media_id";
		if(!"image".equals(type)){
			typeName = type + "_media_id";
		}
		String mediaId = jsonObj.getString(typeName);
		return mediaId;
	}
	
	/**
	 * 获取accessToken
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	public static AccessToken getAccessToken() throws ParseException, IOException{
		AccessToken token = new AccessToken();
		String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
		JSONObject jsonObject = doGetStr(url);
		if(jsonObject!=null){
			token.setToken(jsonObject.getString("access_token"));
			token.setExpiresIn(jsonObject.getInt("expires_in"));
		}
		return token;
	}
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public static UnionID getUnionID(String OPENID) throws Exception{
		UnionID unionid =new UnionID();
		AccessToken token = AccessTokenUtil.accessToken;
		String url = UNIONID_URL.replace("ACCESS_TOKEN", token.getToken()).replace("OPENID", OPENID);
		JSONObject jsonObject = doGetStr(url);
		System.out.println(jsonObject);
		if(jsonObject!=null){
			if(jsonObject.getString("subscribe")=="0"){
				return null;
			}
			unionid.setSubscribe(jsonObject.getString("subscribe"));
			
			unionid.setOpenid(jsonObject.getString("openid"));
			unionid.setNickname(jsonObject.getString("nickname"));
			unionid.setSex(jsonObject.getString("sex"));
			unionid.setCity(jsonObject.getString("city"));
			unionid.setCountry(jsonObject.getString("country"));
			unionid.setProvince(jsonObject.getString("province"));//所在省份
			unionid.setLanguage(jsonObject.getString("language"));
			unionid.setHeadimgurl(jsonObject.getString("headimgurl"));
			unionid.setSubscribe_time(jsonObject.getString("subscribe_time"));
//			unionid.setUnionid(jsonObject.getString("unionid"));
//			unionid.setRemark(jsonObject.getString("remark"));
//			unionid.setGroupid(jsonObject.getString("groupid"));
			/*
			 * tagid_list 	用户被打上的标签ID列表
			 * */
		}
		String sql ="select count(*)NUM from`userinfo` where openid='"+jsonObject.getString("openid")+"'";
		List<Map<String,Object>> list = DBUtil.query(sql);
		if(list.size()!=0){
			int num =Integer.parseInt(list.get(0).get("NUM").toString());
			if(num!=0){
				//更新
				System.out.println("更新");
				sql="update userinfo set NICKNAME='"+unionid.getNickname()+"',HEADIMGURL='"+unionid.getHeadimgurl()+"',SEX='"+unionid.getSex()+"',SUBSCRIBE_TIME='"+unionid.getSubscribe_time()+"',LANGUAGE='"+unionid.getLanguage()+"',CITY='"+unionid.getCity()+"',PROVINCE='"+unionid.getProvince()+"',COUNTRY='"+unionid.getCountry()+"' where openid='"+unionid.getOpenid()+"'";
			}else{
				//新增
				System.out.println("新增");
				sql="insert into userinfo(OPENID,NICKNAME,HEADIMGURL,SEX,SUBSCRIBE_TIME,LANGUAGE,CITY,PROVINCE,COUNTRY) value('"+unionid.getOpenid()+"','"+unionid.getNickname()+"','"+unionid.getHeadimgurl()+"','"+unionid.getSex()+"','"+unionid.getSubscribe_time()+"','"+unionid.getLanguage()+"','"+unionid.getCity()+"','"+unionid.getProvince()+"','"+unionid.getCountry()+"')";
			}
			if(DBUtil.update(sql)){
				System.out.println("用户:"+unionid.getNickname()+"保存成功！");
			}else{
				System.out.println("修改或储存openid的sql语句错误");
			}
		}else{
			System.out.println("查询是否存在此openid的sql语句错误");
		}
		return unionid;
	}
	
	
	/**
	 * 组装菜单
	 * @return
	 */
	public static Menu initMenu(){
		String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
		
		
		Menu menu = new Menu();
		ClickButton button11 = new ClickButton();
		button11.setName("菜单");
		button11.setType("click");
		button11.setKey("11");
		
		ViewButton button21 = new ViewButton();
		button21.setName("电子书");
		button21.setType("view");
		//String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=HOME_REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
		//String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=HOME_REDIRECT_URI&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		button21.setUrl(url.replace("APPID", APPID).replace("REDIRECT_URI",HOME_REDIRECT_URI ));
		
		ViewButton emailbindButton = new ViewButton();
		emailbindButton.setName("邮箱绑定");
		emailbindButton.setType("view");
		//String emailbind_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=EMAILBIND_REDIRECT_URI&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		//String emailbind_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=EMAILBIND_REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
		emailbindButton.setUrl(url.replace("APPID", APPID).replace("REDIRECT_URI",EMAILBIND_REDIRECT_URI ));
		
		ViewButton useractive = new ViewButton();
		useractive.setName("用户激活");
		useractive.setType("view");
		useractive.setUrl(url.replace("APPID", APPID).replace("REDIRECT_URI",USERACTIVE_REDIRECT_URI ));
		
//		ClickButton button32 = new ClickButton();
//		button32.setName("地理位置");
//		button32.setType("location_select");
//		button32.setKey("32");
		
		Button button = new Button();
		button.setName("设置帮助");
		button.setSub_button(new Button[]{useractive,emailbindButton});
		
		menu.setButton(new Button[]{button11,button21,button});
		return menu;
	}
	
	public static int createMenu(String token,String menu) throws ParseException, IOException{
		int result = 0;
		String url = CREATE_MENU_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = doPostStr(url, menu);
		if(jsonObject != null){
			result = jsonObject.getInt("errcode");
		}
		return result;
	}
	
	public static JSONObject queryMenu(String token) throws ParseException, IOException{
		String url = QUERY_MENU_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = doGetStr(url);
		return jsonObject;
	}
	
	public static int deleteMenu(String token) throws ParseException, IOException{
		String url = DELETE_MENU_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = doGetStr(url);
		int result = 0;
		if(jsonObject != null){
			result = jsonObject.getInt("errcode");
		}
		return result;
	}
	/*
	public static String translate(String source) throws ParseException, IOException{
		String url = "http://openapi.baidu.com/public/2.0/translate/dict/simple?client_id=jNg0LPSBe691Il0CG5MwDupw&q=KEYWORD&from=auto&to=auto";
		url = url.replace("KEYWORD", URLEncoder.encode(source, "UTF-8"));
		JSONObject jsonObject = doGetStr(url);
		String errno = jsonObject.getString("errno");
		Object obj = jsonObject.get("data");
		StringBuffer dst = new StringBuffer();
		if("0".equals(errno) && !"[]".equals(obj.toString())){
			TransResult transResult = (TransResult) JSONObject.toBean(jsonObject, TransResult.class);
			Data data = transResult.getData();
			Symbols symbols = data.getSymbols()[0];
			String phzh = symbols.getPh_zh()==null ? "" : "中文拼音："+symbols.getPh_zh()+"\n";
			String phen = symbols.getPh_en()==null ? "" : "英式英标："+symbols.getPh_en()+"\n";
			String pham = symbols.getPh_am()==null ? "" : "美式英标："+symbols.getPh_am()+"\n";
			dst.append(phzh+phen+pham);
			
			Parts[] parts = symbols.getParts();
			String pat = null;
			for(Parts part : parts){
				pat = (part.getPart()!=null && !"".equals(part.getPart())) ? "["+part.getPart()+"]" : "";
				String[] means = part.getMeans();
				dst.append(pat);
				for(String mean : means){
					dst.append(mean+";");
				}
			}
		}else{
			dst.append(translateFull(source));
		}
		return dst.toString();
	}
	
	public static String translateFull(String source) throws ParseException, IOException{
		String url = "http://openapi.baidu.com/public/2.0/bmt/translate?client_id=jNg0LPSBe691Il0CG5MwDupw&q=KEYWORD&from=auto&to=auto";
		url = url.replace("KEYWORD", URLEncoder.encode(source, "UTF-8"));
		JSONObject jsonObject = doGetStr(url);
		StringBuffer dst = new StringBuffer();
		List<Map> list = (List<Map>) jsonObject.get("trans_result");
		for(Map map : list){
			dst.append(map.get("dst"));
		}
		return dst.toString();
	}
	*/
	
	/***
	 * 通过code换取网页授权access_token
	 * @throws IOException 
	 * @throws  
	 */
	public static OAccessToken getOAccessToken(String code) throws Exception{
		OAccessToken otoken = new OAccessToken();
		String url = OAUTH2_ACCESS_TOKEN_URL.replace("APPID", APPID).replace("SECRET", APPSECRET).replace("CODE", code);
		JSONObject jsonObject = doGetStr(url);
		System.out.println(jsonObject);
		if(jsonObject!=null){
			otoken.setAccess_token(jsonObject.getString("access_token"));
			otoken.setExpires_in(jsonObject.getInt("expires_in"));
			otoken.setOpenid(jsonObject.getString("openid"));
			otoken.setRefresh_token(jsonObject.getString("refresh_token"));
			otoken.setScope(jsonObject.getString("scope"));
//			if(jsonObject.getString("unionid")!=null){
//				otoken.setUnionid(jsonObject.getString("unionid"));
//			}
			
		}
		return otoken;
	}
	
	public static String reurl(){
		String url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
		url.replace("APPID", APPID).replace("REDIRECT_URI",HOME_REDIRECT_URI );
		
		return url;
	}
}
