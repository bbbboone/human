package com.bbbboone.security;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class CustomLoginSucessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resq, Authentication auth)
			throws IOException, ServletException {
		log.warn("login success");
		log.warn("id ::"+req.getAuthType());
		
		Set<String> roles = new HashSet<>();
		
		auth.getAuthorities().forEach(a -> roles.add(a.getAuthority()));
	/*	
		if(roles.contains("ROLE_ADMIN")){
			resq.sendRedirect("/sample2/adminIndex");
			return;
		}
		if(roles.contains("ROLE_USER")){
			resq.sendRedirect("/sample2/index");
			return;
		}*/
		resq.sendRedirect("/common/index");
	}

}
