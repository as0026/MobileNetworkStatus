package com.lzd.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class JudgeNetType extends ActionSupport {

	private String beginTime;
	private String endTime;

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String execute() {
		try {
			System.out.println("判断网络类型");
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			String json = "";
			System.out.println("beginTime:" + beginTime);
			System.out.println("endTime:" + endTime);
			beginTime=beginTime.substring(beginTime.length()-9,beginTime.length());
			endTime=endTime.substring(endTime.length()-9,endTime.length());
			
			int start = Integer.parseInt(beginTime);
			int end = Integer.parseInt(endTime);
			int delay = end - start;
			System.out.println("相差:" + delay + "毫秒");
			if (end - start < 1000) {
				// 暂定一秒内加载当做wifi
				System.out.println("wifi网络");
			}else{
				System.out.println("非wifi网络");
			}
			json = "{\"success\":\"true\",\"msg\":\"true\"}";
			PrintWriter pw = response.getWriter();
			pw.write(json);
			pw.flush();
			pw.close();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
