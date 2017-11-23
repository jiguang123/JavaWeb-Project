package bookstore;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.exception.JDBCConnectionException;

import bookstore.database.HibernateUtil;

public class SearchBookAction extends Action {
    private final int PAGE_SIZE = 20;

    public ActionForward execute(ActionMapping mapping, ActionForm srcForm,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActionMessages errors = new ActionMessages();
        String strName = null;
        if (request.getParameter("name") != null) {
            strName = new String(request.getParameter("name").getBytes(
                    "ISO-8859-1"), "GB2312");
        }
        String strPage = request.getParameter("page");
        Session session = HibernateUtil.currentSession();
        try {
            // 转换页码(如未指定则默认第1页)
            int page = strPage == null ? 1 : Integer.parseInt(strPage);
            // 构造查询表达式(此处用简单的模糊查询查找，读者可根据需要自行增加搜索条件和方式)
            String strHql = "from Bookinfo as book";
            if (strName != null) {
                strHql += " where book.bookName like :bookname";
            }
            strHql += " order by book.id desc";
            HibernateUtil.beginTransaction();
            session.flush();
            Query query = session.createQuery(strHql);
            if (strName != null) {
                query.setString("bookname", "%" + strName + "%");
            }
            query.setMaxResults(PAGE_SIZE).setFirstResult(
                    (page - 1) * PAGE_SIZE);
            List result = query.list();
            HibernateUtil.commitTransaction();
            request.setAttribute("result", result);
            // 查询总记录条数
            query = session.createQuery("select count(*) " + strHql);
            if (strName != null) {
                query.setString("bookname", "%" + strName + "%");
            }
            HibernateUtil.beginTransaction();
            int count = ((Integer) query.uniqueResult()).intValue();
            // 计算共有多少页
            int pageCount = count / PAGE_SIZE
                    + (count % PAGE_SIZE == 0 ? 0 : 1);
            HibernateUtil.commitTransaction();

            if (page > 1) {
                request.setAttribute("prevPage", new Integer(page - 1));
            }
            if (page < pageCount) {
                request.setAttribute("nextPage", new Integer(page + 1));
            }
            request.setAttribute("pageCount", new Integer(pageCount));
            request.setAttribute("bookname", strName == null ? "" : strName);
        } catch (NumberFormatException nfe) {
            // 给定的页码不能转换成数字
            errors.add("wrongPage", new ActionMessage("search.wrongPage"));
            this.saveErrors(request, errors);
            return mapping.findForward("errorPage");
        } catch (JDBCConnectionException je) {
            // 数据库连接故障
            errors.add("dbError", new ActionMessage("globle.dbError"));
            this.saveErrors(request, errors);
            return mapping.findForward("errorPage");
        }
        return mapping.findForward("searchResult");
    }

}
