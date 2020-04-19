import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter{

    // 不需要校验权限的URL  容器启动 过滤器初始化时会先加载web.xml文件中配置的不需要校验权限的URL
    String[] noCheckPaths = null;
    // 访问的工程名  同上，假如是访问localhost:8080/user   得到的是/user
    String contextPath = null;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain arg2) throws IOException, ServletException {
        // TODO Auto-generated method stub
        //通过过滤器进行登录过滤，不是进行合法用户名密码登录的，不可以跳转到下一页面，防止通过路径直接访问网页
        HttpServletRequest request1=(HttpServletRequest)request;
        HttpServletResponse response1=(HttpServletResponse)response;
        String path = ((HttpServletRequest) request).getServletPath();

        String username = (String)request1.getSession().getAttribute("usernameSession");
        String password =  (String)request1.getSession().getAttribute("passwordSession");
        if((username != "dubaodan" || password !="123") && this.isVerification(path)){
            response1.sendRedirect("login.html");
        }else{
            arg2.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        // TODO Auto-generated method stub
        // 获取web.xml文件的unCheckPaths元素的内容，即配置的不需要验证的url
        String unCheckPath = config.getInitParameter("unCheckPaths");
        this.noCheckPaths = unCheckPath.split(",");
        contextPath = config.getServletContext().getContextPath();
    }

    /**
     *
     * isVerification(判断指定的url是否需要验证，默认是需要验证的)
     * @param path
     * @return false代表不用验证 true 代表需要进行验证 Boolean
     * @exception
     */
    private Boolean isVerification(String path) {
        // 默认需要验证url
        boolean isVerification = true;

        if ("/".equals(path)) { // 防止无限重定向
            return false;
        }
        for (String p : noCheckPaths) {// 判断该请求url是否需要验证
            if (path.indexOf(p) == 0) {
                isVerification = false;
                break;
            }
        }
        // "/view/" 路径下的js css，不校验
        //if (path.indexOf("/view/") == 0
         //       && (path.indexOf(".js") > 0 || path.indexOf(".js?") > 0 || path.indexOf(".css") > 0)) {
          //  isVerification = false;
        //}
        return isVerification;
    }
}