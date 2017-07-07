package com.simba.util.send;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.simba.cache.RedisUtil;
import com.simba.model.wx.web.JsApiTicket;
import com.simba.util.common.AccessTokenUtil;
import com.simba.util.common.GetUtil;
import com.simba.util.common.WxConstantData;

/**
 * jsapi_ticket
 * 
 * @author caozhejun
 *
 */
@Component
public class JsApiTicketUtil {

	private static final Log logger = LogFactory.getLog(JsApiTicketUtil.class);

	@Autowired
	private AccessTokenUtil accessTokenUtil;

	@Autowired
	private GetUtil getUtil;

	@Value("${access.token.storage}")
	private String storage;

	private String ticket;

	@Resource
	private RedisUtil redisUtil;

	/**
	 * 请求jsapi_ticket
	 */
	public void requestTicket() {
		String url = WxConstantData.getJsApiTicketUrl + "?access_token=" + accessTokenUtil.getAccessToken() + "&type=jsapi";
		JsApiTicket ticket = getUtil.get(url, "请求jsapi_ticket", JsApiTicket.class);
		if (StringUtils.isNotEmpty(ticket.getTicket())) {
			logger.info("从微信服务器获取jsapi_ticket:" + ticket.getTicket() + ",过期时间:" + ticket.getExpires_in());
			saveTicket(ticket.getTicket());
		}
	}

	/**
	 * 保存jsapi_ticket
	 * 
	 * @param ticket
	 */
	private void saveTicket(String ticket) {
		if ("local".equals(storage)) {
			this.ticket = ticket;
		} else {
			redisUtil.set("wx_jsapi_ticket", ticket, 3600);
		}
	}

	/**
	 * 获取jsapi_ticket
	 * 
	 * @return
	 */
	public String getTicket() {
		String result = null;
		if ("local".equals(storage)) {
			result = ticket;
		} else {
			result = (String) redisUtil.get("wx_jsapi_ticket");
		}
		if (StringUtils.isEmpty(result)) {
			this.requestTicket();
			return this.getTicket();
		}
		return result;
	}

}
