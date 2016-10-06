package com.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = 7255250628354791468L;

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		if (null == session.get("user")){
			return "INDEX";
		}
		return arg0.invoke();
	}
}
