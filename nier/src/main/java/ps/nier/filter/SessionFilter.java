package ps.nier.filter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebFilter(filterName="myFilter", urlPatterns="/*")
public class SessionFilter implements Filter {
    private static final Logger logger = LoggerFactory.getLogger(SessionFilter.class);
    
    protected static List<Pattern> excludedPatterns = new ArrayList<Pattern>();

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        excludedPatterns.add(Pattern.compile("home/index.do"));
        excludedPatterns.add(Pattern.compile("^static/+[\\s\\S]*"));
    }


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        String url = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        if (url.startsWith("/") && url.length() > 1) {
            url = url.substring(1);
        }
        if (isExcluded(url)){
            chain.doFilter(httpRequest, httpResponse);
            return;
        } else {
            HttpSession session = httpRequest.getSession();
            if (session.getAttribute("cuurentUser") != null){
                // session存在
                chain.doFilter(httpRequest, httpResponse);
                return;
            } else {
                
                // session不存在 准备跳转失败
                RequestDispatcher dispatcher = httpRequest.getRequestDispatcher("/login/login.do");
                    dispatcher.forward(httpRequest, httpResponse);
                //chain.doFilter(httpRequest, httpResponse);
                return;
            }
        }
    }
    
    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }
    
    private boolean isExcluded(String url) {
        if (!excludedPatterns.isEmpty()) {
            for (Pattern p : excludedPatterns) {
               Matcher m = p.matcher(url);
                if (m.matches()) {
                    return true;
                }
            }
        }
        return false;
    }
}
