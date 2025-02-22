package com.trainTruck.demo.Config;

import java.io.IOException;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

	private  JwtService jwtService=new JwtService();
	private final UserDetailsService userDetailsService ;
	@Override
	protected void doFilterInternal(HttpServletRequest request, 
									HttpServletResponse response, 
									FilterChain filterChain)
			throws ServletException, IOException {
						
					final String authHeader=request.getHeader("Authorization");
					final String jwt; 
					final String userPhoneNumber;
					
					if(authHeader==null || !authHeader.startsWith("Bearer "))
					{
						filterChain.doFilter(request, response);
						return;
					}
					jwt=authHeader.substring(7);
					userPhoneNumber=jwtService.extractPhoneNumber(jwt);
					System.out.println(userPhoneNumber);
					if(userPhoneNumber!= null && SecurityContextHolder.getContext().getAuthentication()==null){
						UserDetails userDetails=userDetailsService.loadUserByUsername(userPhoneNumber);
						if(jwtService.isTokenValid(jwt, userDetails))
						{
							UsernamePasswordAuthenticationToken authToken=new UsernamePasswordAuthenticationToken(
									userDetails,
									null,
									userDetails.getAuthorities()
									);
							authToken.setDetails(
									new WebAuthenticationDetailsSource()
									.buildDetails(request)
									);
							SecurityContextHolder.getContext().setAuthentication(authToken);
						}
					}
					filterChain.doFilter(request, response);
			}

}