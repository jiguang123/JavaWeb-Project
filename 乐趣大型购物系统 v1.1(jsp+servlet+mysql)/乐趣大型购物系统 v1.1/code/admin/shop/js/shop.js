function goodsadd()
{

    
    if(isWhitespace(document.form1.name.value))
     {
     	alert("��������Ʒ���ƣ�");
     	document.form1.name.focus();
     	return false;
     }  
    if(document.form1.parentid.value=='all')
     {
     	
         alert("��ѡ�������Ʒ�Ĵ���");	
         document.form1.parentid.focus();
         return false;
     }	
     
    if(document.form1.catalog_id.value=='all')
     {
         alert("��ѡ�������Ʒ������");	
         document.form1.catalog_id.focus();
         return false;
     }	    
    
     if(isWhitespace(document.form1.manufacturer.value))
     {
     	alert("�����볧�����ƣ�");
     	document.form1.manufacturer.focus();
     	return false;
     }    
  
    if(isWhitespace(document.form1.market_price.value))
     {
     	alert("�������г��۸�");
     	document.form1.market_price.focus();
     	return false;
     }
     
    if(isWhitespace(document.form1.price.value))
     {
     	alert("������ǻ�Ա�۸�");
     	document.form1.price.focus();
     	return false;
     }  
     
    if(isWhitespace(document.form1.member_price.value))
     {
     	alert("�������Ա�۸�");
     	document.form1.member_price.focus();
     	return false;
     }                   
    if(isWhitespace(document.form1.cost_price.value))
     {
     	alert("������ɱ��۸�");
     	document.form1.cost_price.focus();
     	return false;
     }           
     
    if(isWhitespace(document.form1.keywords.value))
     {
     	alert("��������Ʒ�ؼ��֣�");
     	document.form1.keywords.focus();
     	return false;
     }    
     
    if(isWhitespace(document.form1.brief.value))
     {
     	alert("�������̽��ܣ�");
     	document.form1.brief.focus();
     	return false;
     }          
    if(isWhitespace(document.form1.product_intr.value))
     {
     	alert("�������Ʒ����ϸ���ܣ�");
     	document.form1.product_intr.focus();
     	return false;
     }      
    
    return true;     	
    
}

function recommand()
{
	
    if(document.form1.parentid.value=='all')
     {     	
         alert("��ѡ����Ʒ�Ĵ���");	
         document.form1.parentid.focus();
         return false;
     }	    
    else
     {
     	    return true;     	
     } 
   
}