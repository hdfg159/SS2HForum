/**
 * @author hdfg159
 * @date 下午10:20:37
 */
package interceptor;

import utils.LogUtil;
import utils.TimeUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -2796326480994355318L;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		ActionContext actionContext = arg0.getInvocationContext();
		if (actionContext.getSession().get("user") == null) {
			LogUtil.i("拦截器拦截成功:" + TimeUtils.getCurrentTimeInString());
			return "login";
		} else {
			return arg0.invoke();
		}
	}
}
