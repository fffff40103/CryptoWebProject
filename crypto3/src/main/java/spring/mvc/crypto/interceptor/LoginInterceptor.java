package spring.mvc.crypto.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.crypto.model.entity.User;

//攔截器，只要session裡面沒有user就會被強制重新導去login頁面
public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session=request.getSession();
		// 檢查 session 中是否有 user 的物件資料(意味著用戶已經登入)
		if(session.getAttribute("user")!=null) {
		
			return true;
		}
		// 未登入, 導入到登入頁面
		response.sendRedirect(request.getServletContext().getContextPath() + "/mvc/crypto/login");
		return false; // 不放行
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}

}