package ejb;

import java.io.File;
import java.rmi.RemoteException;
import javax.ejb.EJBHome;
import javax.ejb.FinderException;
import javax.ejb.CreateException;
/**
 * ʵ��beanHome�ӿ�
 */
public interface UpFileEntHome extends EJBHome{

	UpFileEntRemote Create(String finalpath,String musicname,
			String musictype,String singername) 
					throws CreateException;	
	UpFileEntRemote findByPrimaryKey(String musicname) throws FinderException, RemoteException;
}
