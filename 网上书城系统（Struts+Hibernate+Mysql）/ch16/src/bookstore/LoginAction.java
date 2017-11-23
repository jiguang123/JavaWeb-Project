package bookstore;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.Query;
import org.hibernate.Session;

import bookstore.database.HibernateUtil;
import bookstore.database.Userinfo;

public class LoginAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm srcForm,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActionMessages errors = new ActionMessages();
        ActionForward forward = mapping.findForward("frontPage");
        LoginForm form = (LoginForm) srcForm;

        try {
            // 检查用户名、密码是否合法
            Session dbSession = HibernateUtil.currentSession();
            HttpSession session = request.getSession();
            String hqlStr = " from Userinfo as u where u.username=:username and u.pwd=:pwd";
            Query query = dbSession.createQuery(hqlStr);
            query.setString("username", form.getUserName());
            query.setString("pwd", form.getPassword());

            List result = query.list();
            System.out.println(result.size());
            if (result.size() == 0) {
                // 不合法
                errors.add("inputErrors", new ActionMessage("index.loginError"));
                this.saveErrors(request, errors);
                forward = mapping.findForward("failed");
            } else {
                // 合法后保存到Session中
                Userinfo user = (Userinfo) result.get(0);
                session.setAttribute("user", user);
                if(user.getPower() == 1) {
                    // 当用户权限为1时在session中做标记
                    // 此时只做一个名为admin的session为标记
                    // 当检测到这个session存在时表明当前用户为管理员
                    // 而不管admin这个session的内容是什么
                    session.setAttribute("admin", "true");
                }
            }
        } catch (Exception e) {
            errors.add("dbError", new ActionMessage("globle.dbError"));
            this.saveErrors(request, errors);
            forward = mapping.getInputForward();
        }

        return forward;
    }
}
