// JavaScript Document
//var GetValue=document.getElementById;
var This_State=false;
var ajax=new AJAXRequest;
ajax.setcharset("GB2312");
//alert(ajax);
//������ʾ���
var This_Content= new Array();
This_Content[0]="<span class='newstate'>����! ����д��������!</span>";
This_Content[1]="<span class='newstate'>����! ����д�����û���!</span>";
This_Content[2]="<span>���ڼ��,���Ժ�!</span>";
This_Content[3]="<span class='newstate'>��Ǹ!�û����ѱ�ע��,������ѡ��!</span>";
This_Content[4]="<span class='newstate'>��Ǹ!�ֻ�����ĳ��ȱ�����11λ,��������д!</span>";
This_Content[5]="<span class='newstate'>��Ǹ!�ֻ��������ȫ������,��������д!</span>";
This_Content[7]="<span class='newstate'>��Ǹ!�ֻ������ѱ�ע��,������ѡ��!</span>";
This_Content[8]="<span class='newstate'>��Ǹ!�����ַ�ѱ�ע��,������ѡ��!</span>";
This_Content[9]="<span class='newstate'>����! ����д��������!</span>";
This_Content[10]="<span class='newstate'>����! ����дȷ������!</span>";
This_Content[11]="<span class='newstate'>����! �����������벻һ��,����������!</span>";
This_Content[13]="<span class='newstate'>����! ��������������!</span>";
This_Content[14]="<span class='newstate'>�����ַ����,����������!</span>";
This_Content[15]="<span class='newstate'>����! ����д�����ֻ���!</span>";
This_Content[16]="<span class='newstate'>����! �û��������ϳ���(3-20λ),����������!</span>";
This_Content[17]="<span class='newstate'>����! ���벻���ϳ���(6-20λ),����������!</span>";
This_Content[18]="<span class='newstate'>����! ����д����!</span>";
This_Content[19]="<span class='newstate'>����! ����д���ڳ���!</span>";
This_Content[20]="<span class='newstate'>����! ��ѡ����������,��ֻ��д�·�,����!</span>";
This_Content[21]="<span class='newstate'>����! ����������֤������!</span>";

//��ȷ��ʾ���
var True_Content= new Array();
True_Content[0]="<span class='okstate'>��ȷ!</span>";
True_Content[1]="<span class='okstate'>��ǰ�û�������!</span>";
True_Content[2]="<span class='okstate'>�ɹ�!</span>";
True_Content[3]="<span class='okstate'>��ǰ�ֻ��������!</span>";
True_Content[4]="<span class='okstate'>��ǰ�����ַ����!</span>";
//�����������
var On_Xing="<span class='newstate'>����!  ����д��������!!</span>";
var On_User_Name="<span class='newstate'>����!  ����д�����û���!!</span>";
var On_User_Password="<span class='newstate'>����!  ����д��������!!</span>";
var On_user_Password2="<span class='newstate'>����!  ����ȷ��һ������!!</span>";
var On_User_Mobile="<span class='newstate'>����!  ����д�����ֻ���!!</span>";
var On_User_Email="<span class='newstate'>����!  ��������������!!</span>";
var On_User_Country="<span class='newstate'>����! ����д����!!</span>";
var On_User_City="<span class='newstate'>����! ����д���ڳ���!!</span>";
var On_User_Birthday="<span class='newstate'>����! ��ѡ����������,��ֻ��д�·�,����!!</span>";
var On_User_Card="<span class='newstate'>����! ����������֤������!!</span>";
//���������ʾ����
var Err_Content="";
//��֤�û�����
function Check_User_Xing(){
	var User_Xing=ReplaceStr(document.getElementById("User_Xing").value);
	document.getElementById("User_Xing").value=User_Xing;
	if (User_Xing==""||User_Xing==null){
		document.getElementById("U_Name").innerHTML=This_Content[0];
		This_State=true;
		On_Xing=This_Content[0];
		}
	//alert(User_Xing);
	}
function Check_User_Ming(){
	var User_Ming=ReplaceStr(document.getElementById("User_Ming").value);
	var User_Xing=ReplaceStr(document.getElementById("User_Xing").value);
	document.getElementById("User_Ming").value=User_Ming;	
	if (User_Ming==""||User_Ming==null){
		document.getElementById("U_Name").innerHTML=This_Content[0];
		This_State=true;
		On_Xing=This_Content[0];
		}else if(User_Xing!=""&&User_Xing!=null&&User_Ming!=""&&User_Ming!=null){
			document.getElementById("U_Name").innerHTML=True_Content[0];
			On_Xing="OK";
			}
	}
//��֤�û���
function Check_User_Name(txt){
	var this_type=txt;
	var User_Name=ReplaceStr(document.getElementById("User_Name").value);
	document.getElementById("User_Name").value=User_Name;
	if (User_Name==""||User_Name==null){
		document.getElementById("U_ID").innerHTML=This_Content[1];
		This_State=true;
		On_User_Name=This_Content[1];
	}else if(User_Name.length<3||User_Name.length>20){
		document.getElementById("U_ID").innerHTML=This_Content[16];
		This_State=true;
		On_User_Name=This_Content[16];
		}else{
		document.getElementById("U_ID").innerHTML=This_Content[2];
		//alert(User_Name);
		if (txt=="0"){
		Send_value(User_Name,'1','0');
		}else{
		Send_value(User_Name,'1',this_type);
			}
		//results=document.getElementById("postresults").value;
		//alert(results);		
	}
}
//��֤����
function Check_User_Password(){
	var User_Password=ReplaceStr(document.getElementById("User_Password").value);
	document.getElementById("User_Password").value=User_Password;
	
	//alert(User_Password);
	if (User_Password==""||User_Password==null){
		document.getElementById("U_Pwd").innerHTML=This_Content[9];
		This_State=true;
		On_User_Password=This_Content[9];
		}else if(User_Password.length<6||User_Password.length>20){
		document.getElementById("U_Pwd").innerHTML=This_Content[17];
		This_State=true;
		On_User_Password=This_Content[17];
		}else{
			document.getElementById("U_Pwd").innerHTML="";
			On_User_Password="OK";
			}
	}
function Check_User_Password2(){
	var User_Password=ReplaceStr(document.getElementById("User_Password").value);
	var User_Password2=ReplaceStr(document.getElementById("User_Password2").value);
	document.getElementById("User_Password2").value=User_Password2;
	if (User_Password2==""||User_Password2==""){
		document.getElementById("U_Cpwd").innerHTML=This_Content[10];
		On_user_Password2=This_Content[10];
		}else if(User_Password!=User_Password2){
		document.getElementById("U_Cpwd").innerHTML=This_Content[11];
		On_user_Password2=This_Content[11];
		This_State=true;
		}else{
			document.getElementById("U_Cpwd").innerHTML=True_Content[2];
			On_user_Password2="OK";
			}
	}
//��֤�ֻ�
function Check_User_Mobile(txt){
	var this_type=txt;
	var User_Mobile=ReplaceStr(document.getElementById("User_Mobile").value);
	document.getElementById("User_Mobile").value=User_Mobile;
	//alert(User_Mobile.length);
	if (User_Mobile==""||User_Mobile==null){
		document.getElementById("U_Phone").innerHTML=This_Content[15];
		This_State=true;
		On_User_Mobile=This_Content[15];
		
	}else if(User_Mobile.length!=11){
		document.getElementById("U_Phone").innerHTML=This_Content[4];
		This_State=true;
		On_User_Mobile=This_Content[4];
		}else if(Check_Digital(User_Mobile)==false){
			document.getElementById("U_Phone").innerHTML=This_Content[5];
			On_User_Mobile=This_Content[5];
			This_State=true;
			}else{
		document.getElementById("U_Phone").innerHTML=This_Content[2];
		//alert(User_Name);
		if (txt=="0"){
		Send_value(User_Mobile,'2','0');
		}else{
		Send_value(User_Mobile,'2',this_type);
			}
		//results=document.getElementById("postresults").value;
		//alert(results);		
	}
}	
//��֤����
function Check_User_Email(txt){
	var this_type=txt;
	var User_Email=ReplaceStr(document.getElementById("User_Email").value);
	document.getElementById("User_Email").value=User_Email;
	if (User_Email==""||User_Email==null){
		document.getElementById("U_Email").innerHTML=This_Content[13];
		This_State=true;
		On_User_Email=This_Content[13];
	}else if(Check_Email(User_Email)==false){
		document.getElementById("U_Email").innerHTML=This_Content[14];
		This_State=true;
		On_User_Email=This_Content[14];
		}else{
		document.getElementById("U_Email").innerHTML=This_Content[2];
		//alert(User_Name);
				if (txt=="0"){
		Send_value(User_Email,'3','0');
		}else{
		Send_value(User_Email,'3',this_type);
			}
		//results=document.getElementById("postresults").value;
		//alert(results);		
	}
}	
//��֤����
function Check_User_Country(){
	var User_Country=ReplaceStr(document.getElementById("User_Country").value);
	document.getElementById("User_Country").value=User_Country;
	
	//alert(User_Password);
	if (User_Country==""||User_Country==null){
		document.getElementById("U_Country").innerHTML=This_Content[18];
		This_State=true;
		On_User_Country=This_Content[18];
		}else{
			document.getElementById("U_Country").innerHTML=True_Content[2];
			On_User_Country="OK";
			}
	}
//��֤����
function Check_User_City(){
	var User_City=ReplaceStr(document.getElementById("User_City").value);
	document.getElementById("User_City").value=User_City;
	
	//alert(User_Password);
	if (User_City==""||User_City==null){
		document.getElementById("U_City").innerHTML=This_Content[19];
		This_State=true;
		On_User_City=This_Content[19];
		}else{
			document.getElementById("U_City").innerHTML=True_Content[2];
			On_User_City="OK";
			}
	}	
//��֤����
function Check_User_Birthday(){
	
	var Check_User_Birthday_YY=ReplaceStr(document.getElementById("User_Birthday_YY").value);
	var Check_User_Birthday_MM=ReplaceStr(document.getElementById("User_Birthday_MM").value);
	var Check_User_Birthday_DD=ReplaceStr(document.getElementById("User_Birthday_DD").value);
	document.getElementById("User_Birthday_YY").value=Check_User_Birthday_YY;
	document.getElementById("User_Birthday_MM").value=Check_User_Birthday_MM;
	document.getElementById("User_Birthday_DD").value=Check_User_Birthday_DD;	
	//alert(User_Password);
	if (Check_User_Birthday_MM==""||Check_User_Birthday_MM==null||Check_User_Birthday_DD==""||Check_User_Birthday_DD==null){
		document.getElementById("U_Birthday").innerHTML=This_Content[20];
		This_State=true;
		On_User_Birthday=This_Content[20];
		}else{
			document.getElementById("U_Birthday").innerHTML=True_Content[2];
			On_User_Birthday="OK";
			}
	}
//��֤ʡ��֤��
function Check_User_Card(){
	
	var Check_User_Card_Class=ReplaceStr(document.getElementById("User_Card_Class").value);
	var Check_User_Card_Number=ReplaceStr(document.getElementById("User_Card_Number").value);
	document.getElementById("User_Card_Number").value=Check_User_Card_Number;	
	//alert(User_Password);
	if (Check_User_Card_Class=="0"||Check_User_Card_Number==""||Check_User_Card_Number==null){
		document.getElementById("U_Card").innerHTML=This_Content[21];
		This_State=true;
		On_User_Card=This_Content[21];
		}else{
			document.getElementById("U_Card").innerHTML=True_Content[2];
			On_User_Card="OK";
			}
	}	
	
	
//�滻ȫ�����ֺ���
function ReplaceStr(val){
		var Str=val;
	for(var i=0; i<Str.length; i++){
		Str=Str.replace("��","0");
		Str=Str.replace("��","1");
		Str=Str.replace("��","2");
		Str=Str.replace("��","3");
		Str=Str.replace("��","4");
		Str=Str.replace("��","5");
		Str=Str.replace("��","6");
		Str=Str.replace("��","7");
		Str=Str.replace("��","8");
		Str=Str.replace("��","9");
		}
		return Str
	}
//��֤�����Ƿ�ȫ�����ֺ���
function Check_Digital(txt){
	var allValid=true;
	var content=txt;
	var checkOK = "0123456789";
		for (i = 0;  i < content.length;  i++)
		{
		   ch = content.charAt(i);
		   for (j = 0;  j < checkOK.length;  j++)
		     if (ch == checkOK.charAt(j))
		      break;
			  if (j == checkOK.length)
			   {
			     allValid = false;
			      break;
			    }
		}
	return allValid;
	}
//��֤�����ַ����
function Check_Email(txt){
	var allValid=true;
	var content=txt;
	var	checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_@.-";
	for (i = 0;  i < content.length;  i++)
		{
		   ch = content.charAt(i);
		   for (j = 0;  j < checkOK.length;  j++)
		     if (ch == checkOK.charAt(j))
		      break;
			  if (j == checkOK.length)
			   {
			     allValid = false;
			      break;
			    }
		}
	if (content.indexOf("@")==-1){
		allValid = false;
		}
	if (content.indexOf(".")==-1){
		allValid = false;
		}
	return allValid;
	}
//AJAX��֤�ֻ�����,�û���,���亯��
function Send_value(chr,type,uid){
	var this_value=chr;
	var this_type=type;
	var this_uid=uid;
	var this_user_name=document.getElementById("U_ID");
	var this_user_mobile=document.getElementById("U_Phone");
	var this_user_email=document.getElementById("U_Email");
	var varchr;
	//alert("/member/Check_All.asp?this_type="+this_type+"&this_value="+chr+"&this_uid"+this_uid);
	//alert("Check_All.asp?this_type="+this_type+"&this_value="+chr);
	ajax.get("/member/Check_All.asp?this_type="+this_type+"&this_value="+chr+"&this_uid="+this_uid,
			 function(obj) {
				//alert(this_type);
				//document.getElementById("postresults").value=obj.responseText;
				  varchr=obj.responseText;
				  //alert (this_user_name.value);	
				 if (varchr=="true"){	 
					switch(this_type){
						case "1":
						//this_user_name.innerHTML=True_Content[4];
						document.getElementById("U_ID").innerHTML=True_Content[1];
						On_User_Name="OK";
						break;
						case "2":
						document.getElementById("U_Phone").innerHTML=True_Content[3];
						On_User_Mobile="OK";
						break;
						case "3":
						document.getElementById("U_Email").innerHTML=True_Content[4];
						On_User_Email="OK";
						break;
						}
						//�޸�ȫ�ֱ���Ϊ��
					}else{
					switch(this_type){
						case "1":
						document.getElementById("U_ID").innerHTML=This_Content[3];
						On_User_Name=This_Content[3];
						break;
						case "2":
						document.getElementById("U_Phone").innerHTML=This_Content[7];
						On_User_Mobile=This_Content[7];
						break;
						case "3":
						document.getElementById("U_Email").innerHTML=This_Content[8];
						On_User_Email=This_Content[8];
						break;
						}
						//�޸�ȫ�ֱ���Ϊ��
					}
				
			});
	}
//��֤��
function This_Submit(){
	//this_txt=document.getElementById("Err_Content");
 if (On_Xing=="OK"&&On_User_Name=="OK"&&On_User_Password=="OK"&&On_user_Password2=="OK"&&On_User_Mobile=="OK"&&On_User_Email=="OK"){
		  document.form1.submit();
		 }else{
	Err_Content="<p class='tstitle'>��ʾ</p>";
	if (On_Xing!="OK"){
		Err_Content=Err_Content+"<p>"+On_Xing+"</p>";
		}	 
	if (On_User_Name!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Name+"</p>";
		}
	if (On_User_Password!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Password+"</p>";
		}
	if (On_user_Password2!="OK"){
		Err_Content=Err_Content+"<p>"+On_user_Password2+"</p>";
		}
	if (On_User_Mobile!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Mobile+"</p>";
		}
	if (On_User_Email!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Email+"</p>";
		}
		//alert(document.getElementById("Err_Content").innerHTML);
		document.getElementById("Err_Content").style.display="block";
		document.getElementById("Err_Content").innerHTML=Err_Content;
		return (false);
	 }	//alert(On_Xing+On_User_Name+On_User_Password+On_user_Password2+On_User_Mobile+On_User_Email);
	
	}
//��֤��
function Check_Submit(){
	//this_txt=document.getElementById("Err_Content");
	Err_Content="<p class='tstitle'>��ʾ</p>";
	if (!(On_Xing=="OK"||On_Xing=="<span class='newstate'>����!  ����д��������!!</span>")){
		Err_Content=Err_Content+"<p>"+On_Xing+"</p>";
		}	 
	if (!(On_User_Name=="OK"||On_User_Name=="<span class='newstate'>����!  ����д�����û���!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Name+"</p>";
		}
	if (!(On_User_Password=="OK"||On_User_Password=="<span class='newstate'>����!  ����д��������!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Password+"</p>";
		}
	if (!(On_user_Password2=="OK"||On_user_Password2=="<span class='newstate'>����!  ����ȷ��һ������!!</span>")){
		Err_Content=Err_Content+"<p>"+On_user_Password2+"</p>";
		}
	if (!(On_User_Mobile=="OK"||On_User_Mobile=="<span class='newstate'>����!  ����д�����ֻ���!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Mobile+"</p>";
		}
	if (!(On_User_Email=="OK"||On_User_Email=="<span class='newstate'>����!  ��������������!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Email+"</p>";
		}
		Check_User_Country();
	if (!(On_User_Country=="OK"||On_User_Country=="<span class='newstate'>����! ����д����!!</span>")){
		
		Err_Content=Err_Content+"<p>"+On_User_Country+"</p>";
		}
		Check_User_City();
	if (!(On_User_City=="OK"||On_User_City=="<span class='newstate'>����! ����д���ڳ���!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_City+"</p>";
		}
		Check_User_Birthday();
	if (!(On_User_Birthday=="OK"||On_User_Birthday=="<span class='newstate'>����! ��ѡ����������,��ֻ��д�·�,����!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Birthday+"</p>";
		}
		Check_User_Card();
	if (!(On_User_Card=="OK"||On_User_Card=="<span class='newstate'>����! ����������֤������!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Card+"</p>";
		}
 	if (Err_Content=="<p class='tstitle'>��ʾ</p>"){
		  document.form1.submit();
		 }else{
		//alert(document.getElementById("Err_Content").innerHTML);
		document.getElementById("Err_Content").style.display="block";
		document.getElementById("Err_Content").innerHTML=Err_Content;
		return (false);
	 }	//alert(On_Xing+On_User_Name+On_User_Password+On_user_Password2+On_User_Mobile+On_User_Email);
	
	}