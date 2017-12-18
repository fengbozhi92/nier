package ps.nier.config;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

import ps.nier.core.dictionary.UserRoleEnum;
import ps.nier.core.domain.permission.Permission;
import ps.nier.service.permission.PermissionService;
import ps.nier.service.user.imp.CustomUserServiceImp;
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private PermissionService permissionService;
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
			.antMatchers(HttpMethod.GET,"/nier/**","/file/**")
			.antMatchers(HttpMethod.GET, "/third-party/**");
	}

	@Override
    protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		Map<Integer, List<Permission>> mapping = permissionService.getAllMapping();
		if (mapping != null) {
		    String[] anonUrls = null;
		    for (Integer role :mapping.keySet()) {
		        for(UserRoleEnum u : UserRoleEnum.getEnumValues()) {
		            if (role == u.getValue()) {
	                    List<Permission> anons = mapping.get(role);
	                    anonUrls = new String[anons.size()];
	                    for (int i=0;i<anons.size();i++){
	                        anonUrls[i] = anons.get(i).getFunction().getUrl();
	                    }
	                }
		        }
		        
		    }
		}
        http.authorizeRequests()
        		.antMatchers("/",
        					 "/login/**",
        					 "/register/**",
        					 "/home/**",
        					 "/group/**",
        					 "/post/**",
        					 "/postthread/**").permitAll()
        		.antMatchers("/person/**",
        					 "/group/add.do").hasRole("USER")
        		.antMatchers("/manager/**").hasRole("MANAGER")
        		.antMatchers("/developer/**").hasRole("NIER")
        		.anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login/login.do")
                .defaultSuccessUrl("/home/index.do")
                .failureUrl("/login/login.do")
                .permitAll()
                .and()
            .logout()
            	.logoutUrl("/logout/logout.do")
            	.logoutSuccessUrl("/home/index.do")
//            	.logoutSuccessHandler(logoutSuccessHandler)
            	.invalidateHttpSession(true)
//            	.addLogoutHandler(logoutHandler)
//            	.deleteCookies(cookieNamesToClear)
                .permitAll()
                .and()
            .anonymous()
                .authorities(UserRoleEnum.Anonymity.getRole())
                .and()
            .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/login?expired");       
    }
	
	@Bean
    UserDetailsService customUserService() {
        return new CustomUserServiceImp();
    }
	
	@Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
        	.userDetailsService(customUserService());
//            .inMemoryAuthentication()
//            .withUser("nier").password("manager").roles(SystemConfigConstants.ROLE_MANAGER);
    }
}
