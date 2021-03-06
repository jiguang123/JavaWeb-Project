package com.xaccp.po;

import java.util.HashSet;
import java.util.Set;


/**
 * EnterpriseInfo generated by MyEclipse - Hibernate Tools
 */

public class EnterpriseInfo  implements java.io.Serializable {


    // Fields    

     private Integer EId;
     private String EName;
     private String EPass;
     private String ECompanyName;
     private String ELinkMan;
     private String ETel;
     private String EAddress;
     private String EEmail;
     private Set foodInfos = new HashSet(0);
     private Set orderInfos = new HashSet(0);


    // Constructors

    /** default constructor */
    public EnterpriseInfo() {
    }

	/** minimal constructor */
    public EnterpriseInfo(Integer EId, String EName, String EPass) {
        this.EId = EId;
        this.EName = EName;
        this.EPass = EPass;
    }
    
    /** full constructor */
    public EnterpriseInfo(Integer EId, String EName, String EPass, String ECompanyName, String ELinkMan, String ETel, String EAddress, String EEmail, Set foodInfos, Set orderInfos) {
        this.EId = EId;
        this.EName = EName;
        this.EPass = EPass;
        this.ECompanyName = ECompanyName;
        this.ELinkMan = ELinkMan;
        this.ETel = ETel;
        this.EAddress = EAddress;
        this.EEmail = EEmail;
        this.foodInfos = foodInfos;
        this.orderInfos = orderInfos;
    }

   
    // Property accessors

    public Integer getEId() {
        return this.EId;
    }
    
    public void setEId(Integer EId) {
        this.EId = EId;
    }

    public String getEName() {
        return this.EName;
    }
    
    public void setEName(String EName) {
        this.EName = EName;
    }

    public String getEPass() {
        return this.EPass;
    }
    
    public void setEPass(String EPass) {
        this.EPass = EPass;
    }

    public String getECompanyName() {
        return this.ECompanyName;
    }
    
    public void setECompanyName(String ECompanyName) {
        this.ECompanyName = ECompanyName;
    }

    public String getELinkMan() {
        return this.ELinkMan;
    }
    
    public void setELinkMan(String ELinkMan) {
        this.ELinkMan = ELinkMan;
    }

    public String getETel() {
        return this.ETel;
    }
    
    public void setETel(String ETel) {
        this.ETel = ETel;
    }

    public String getEAddress() {
        return this.EAddress;
    }
    
    public void setEAddress(String EAddress) {
        this.EAddress = EAddress;
    }

    public String getEEmail() {
        return this.EEmail;
    }
    
    public void setEEmail(String EEmail) {
        this.EEmail = EEmail;
    }

    public Set getFoodInfos() {
        return this.foodInfos;
    }
    
    public void setFoodInfos(Set foodInfos) {
        this.foodInfos = foodInfos;
    }

    public Set getOrderInfos() {
        return this.orderInfos;
    }
    
    public void setOrderInfos(Set orderInfos) {
        this.orderInfos = orderInfos;
    }
   








}