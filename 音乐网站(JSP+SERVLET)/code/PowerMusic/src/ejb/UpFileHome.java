package ejb;

import java.io.Serializable;
import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.io.*;

/**
 *@��״̬SessionBean��Home�ӿ�
 */
public interface UpFileHome extends EJBHome {
	UpFileRemote Create(String finalpath,String musicname,String musictype,String singername) 
				throws CreateException,RemoteException;

}
