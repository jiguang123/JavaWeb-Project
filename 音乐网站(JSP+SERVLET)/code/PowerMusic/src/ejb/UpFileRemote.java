package ejb;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
/**
 * @��״̬SessionBean��remote�ӿ�
 */
public interface UpFileRemote extends EJBObject{
	public boolean startEntBean(String finalpath ,String musicname,String musictype,String singername)
				throws RemoteException;
	
}
