package com.wx.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;
import com.wx.po.Image;
import com.wx.po.ImageMessage;
import com.wx.po.Music;
import com.wx.po.MusicMessage;
import com.wx.po.News;
import com.wx.po.NewsMessage;
import com.wx.po.TextMessage;
/**
 * 消息封装类
 * @author Stephen
 *
 */
public class MessageUtil {	
	
	public static final String MESSAGE_TEXT = "text";
	public static final String MESSAGE_NEWS = "news";
	public static final String MESSAGE_IMAGE = "image";
	public static final String MESSAGE_VOICE = "voice";
	public static final String MESSAGE_MUSIC = "music";
	public static final String MESSAGE_VIDEO = "video";
	public static final String MESSAGE_LINK = "link";
	public static final String MESSAGE_LOCATION = "location";
	public static final String MESSAGE_EVNET = "event";
	public static final String MESSAGE_SUBSCRIBE = "subscribe";
	public static final String MESSAGE_UNSUBSCRIBE = "unsubscribe";
	public static final String MESSAGE_CLICK = "CLICK";
	public static final String MESSAGE_VIEW = "VIEW";
	public static final String MESSAGE_SCANCODE= "scancode_push";
	
	/**
	 * xml转为map集合
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws DocumentException
	 */
	public static Map<String, String> xmlToMap(HttpServletRequest request) throws IOException, DocumentException{
		Map<String, String> map = new HashMap<String, String>();
		SAXReader reader = new SAXReader();
		
		InputStream ins = request.getInputStream();
		Document doc = reader.read(ins);
		
		Element root = doc.getRootElement();
		
		List<Element> list = root.elements();
		
		for(Element e : list){
			map.put(e.getName(), e.getText());
		}
		ins.close();
		return map;
	}
	
	/**
	 * 将文本消息对象转为xml
	 * @param textMessage
	 * @return
	 */
	public static String textMessageToXml(TextMessage textMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", textMessage.getClass());
		return xstream.toXML(textMessage);
	}
	
	/**
	 * 组装文本消息
	 * @param toUserName
	 * @param fromUserName
	 * @param content
	 * @return
	 */
	public static String initText(String toUserName,String fromUserName,String content){
		TextMessage text = new TextMessage();
		text.setFromUserName(toUserName);
		text.setToUserName(fromUserName);
		text.setMsgType(MessageUtil.MESSAGE_TEXT);
		text.setCreateTime(new Date().getTime());
		text.setContent(content);
		return textMessageToXml(text);
	}
	
	/**
	 * 主菜单
	 * @return
	 */
	public static String menuText(){
		StringBuffer sb = new StringBuffer();
		sb.append("请回复需要帮助的问题序号：");
		sb.append("1、创建我的简历\n");
		sb.append("2、修改简历\n");
		sb.append("3、查看我投递了哪些公司\n");
		sb.append("4、查看企业联系方式\n");
		sb.append("5、企业注册\n");
		sb.append("6、企业认证\n");
		sb.append("7、职位发布与管理\n");
		sb.append("8、简历管理，职位邀请\n");
		sb.append("9、其他问题");
		return sb.toString();
	}
	
	public static String firstMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请在手机微信上依次点击 我、 我的简历，如实填写信息保存即可。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	
	public static String secondMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请在手机微信上依次点击 我  、 我的简历 、点击右侧 编辑 编辑并保存个人信息，工作经历等修改方式如上。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	public static String threeMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请在手机微信上依次点击我、投递反馈 即可查看。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	public static String fourMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("尊敬的用户您好，本平台本着保护用户隐私的原则，暂不开放 查看企业联系方式 功能，请谅解。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	public static String fiveMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请依次点击公众号下方 我的、企业入口、我要注册， 填写信息后即可注册。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	public static String sixMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请您登录边学边实践官方网站进行认证操作bianxuebianshijian.com。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	public static String sevenMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请您登录边学边实践官方网站进行职位发布操作bainxuebianshijian.com，\n");
		sb.append("职位管理请通过企业入口登录微信端招聘页面，依次点击 我、发布的职位 进行管理。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	public static String eightMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请通过微信企业入口登录招聘页面，依次点击 我、职位处理 即可查看应聘者简历信息等操作。\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	public static String nineMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("请拨打24小时客服热线0535-6752535进行咨询，谢谢.\n\n");
		sb.append("回复？显示主菜单。");
		return sb.toString();
	}
	
	/**
	 * 图文消息转为xml
	 * @param newsMessage
	 * @return
	 */
	public static String newsMessageToXml(NewsMessage newsMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", newsMessage.getClass());
		xstream.alias("item", new News().getClass());
		return xstream.toXML(newsMessage);
	}
	
	/**
	 * 图片消息转为xml
	 * @param imageMessage
	 * @return
	 */
	public static String imageMessageToXml(ImageMessage imageMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", imageMessage.getClass());
		return xstream.toXML(imageMessage);
	}
	
	/**
	 * 音乐消息转为xml
	 * @param musicMessage
	 * @return
	 */
	public static String musicMessageToXml(MusicMessage musicMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", musicMessage.getClass());
		return xstream.toXML(musicMessage);
	}
	/**
	 * 图文消息的组装
	 * @param toUserName
	 * @param fromUserName
	 * @return
	 */
	public static String initNewsMessage(String toUserName,String fromUserName){
		String message = null;
		List<News> newsList = new ArrayList<News>();
		NewsMessage newsMessage = new NewsMessage();
		
		News news = new News();
		news.setTitle("Kindle书城欢迎您的关注");
		news.setDescription("用的书心,看的放心!");
		news.setPicUrl("http://image.baidu.com/search/detail?ct=503316480&z=undefined&tn=baiduimagedetail&ipn=d&word=kindle%E4%B9%A6%E5%9F%8E%20%E5%9B%BE%E6%A0%87&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=undefined&cs=1760831940,4080499682&os=2833788722,3529168990&simid=92258655,764279888&pn=16&rn=1&di=168297807040&ln=1971&fr=&fmq=1474027686886_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&is=&istype=0&ist=&jit=&bdtype=0&adpicid=0&pi=0&gsm=0&objurl=http%3A%2F%2Fwww.topys.cn%2Fattachments%2F1404%2F04%2F533e4f262da0e.png&rpstart=0&rpnum=0&adpicid=0&ctd=1474027698723^3_1349X643%1");
		news.setUrl("DemonGao.github.io");
		
		newsList.add(news);
		
		newsMessage.setToUserName(fromUserName);
		newsMessage.setFromUserName(toUserName);
		newsMessage.setCreateTime(new Date().getTime());
		newsMessage.setMsgType(MESSAGE_NEWS);
		newsMessage.setArticles(newsList);
		newsMessage.setArticleCount(newsList.size());
		
		message = newsMessageToXml(newsMessage);
		return message;
	}
	
	/**
	 * 组装图片消息
	 * @param toUserName
	 * @param fromUserName
	 * @return
	 */
	public static String initImageMessage(String toUserName,String fromUserName){
		String message = null;
		Image image = new Image();
		image.setMediaId("JTH8vBl0zDRlrrn2bBnMleySuHjVbMhyAo0U2x7kQyd1ciydhhsVPONbnRrKGp8m");
		ImageMessage imageMessage = new ImageMessage();
		imageMessage.setFromUserName(toUserName);
		imageMessage.setToUserName(fromUserName);
		imageMessage.setMsgType(MESSAGE_IMAGE);
		imageMessage.setCreateTime(new Date().getTime());
		imageMessage.setImage(image);
		message = imageMessageToXml(imageMessage);
		return message;
	}
	
	/**
	 * 组装音乐消息
	 * @param toUserName
	 * @param fromUserName
	 * @return
	 */
	public static String initMusicMessage(String toUserName,String fromUserName){
		String message = null;
		Music music = new Music();
		music.setThumbMediaId("WsHCQr1ftJQwmGUGhCP8gZ13a77XVg5Ah_uHPHVEAQuRE5FEjn-DsZJzFZqZFeFk");
		music.setTitle("see you again");
		music.setDescription("速7片尾曲");
		music.setMusicUrl("http://zapper.tunnel.mobi/Weixin/resource/See You Again.mp3");
		music.setHQMusicUrl("http://zapper.tunnel.mobi/Weixin/resource/See You Again.mp3");
		
		MusicMessage musicMessage = new MusicMessage();
		musicMessage.setFromUserName(toUserName);
		musicMessage.setToUserName(fromUserName);
		musicMessage.setMsgType(MESSAGE_MUSIC);
		musicMessage.setCreateTime(new Date().getTime());
		musicMessage.setMusic(music);
		message = musicMessageToXml(musicMessage);
		return message;
	}
}
