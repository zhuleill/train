package com.zl.biz.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.zl.biz.TicketBiz;
import com.zl.dao.Price_ListDao;
import com.zl.dao.TicketDao;
import com.zl.entity.Ticket;

public class TicketBizImpl implements TicketBiz {
	private TicketDao ticketDao;
	private Price_ListDao price_ListDao;


	public Price_ListDao getPrice_ListDao() {
		return price_ListDao;
	}

	public void setPrice_ListDao(Price_ListDao price_ListDao) {
		this.price_ListDao = price_ListDao;
	}

	public TicketDao getTicketDao() {
		return ticketDao;
	}

	public void setTicketDao(TicketDao ticketDao) {
		this.ticketDao = ticketDao;
	}

	public int addTicket(Ticket ticket) {
		return ticketDao.addTicket(ticket);
	}

	public int deleteTicket(int train_no) {
		return ticketDao.deleteTicket(train_no);
	}

	public List<Ticket> getAll() {
		return ticketDao.getAll();
	}

	public Ticket getTicketById(int train_no) {
		return ticketDao.getTicketById(train_no);
	}

	public int updateTicket(Ticket ticket) {
		return ticketDao.updateTicket(ticket);
	}
	

	 public static final String DEF_CHATSET = "UTF-8";
	    public static final int DEF_CONN_TIMEOUT = 30000;
	    public static final int DEF_READ_TIMEOUT = 30000;
	    public static String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
	 
	    //�����������KEY
	    public static final String APPKEY ="e804b4e476cc491698119a7ab4363767";
	 
	    //1.վ��վ��ѯ����Ʊ�ۣ�
	    public  void getRequest1(){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/s2swithprice";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("start","�Ϻ�����");//����վ
	            params.put("end","������");//�յ�վ
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	            params.put("dtype","");//�������ݵĸ�ʽ,xml��json��Ĭ��json
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println("1"+object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	    //2.12306��Ʊ�ڣ�����Ʊ�۲�ѯ
	    public  void getRequest2(){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/ticket.price.php";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("train_no","13000G125107");//�дα�ţ���Ӧ12306��Ʊ�٣���ѯ�����з��ص�train_no
	            params.put("from_station_no","CXH");//����վ��ţ���Ӧ12306��Ʊ�٣���ѯ�����з��ص�from_station_no
	            params.put("to_station_no","AOH");//����վ��ţ���Ӧ12306��Ʊ�٣���ѯ�����з��ص�to_station_no
	            params.put("date","2017-04-30");//Ĭ�ϵ��죬��ʽ��2014-12-25
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println("2"+object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	    //3.���β�ѯ
	    public  JSONObject getRequest3(String train_no){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/s";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("name",train_no);//�������ƣ��磺G4
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	            params.put("dtype","");//�������ݵĸ�ʽ,xml��json��Ĭ��json
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                return object;
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	 
	    //4.վ��վ��ѯ
	    public  void getRequest4(){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/s2s";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("start","�Ϻ�����");//����վ
	            params.put("end","������");//�յ�վ
	            params.put("traintype","");//�г����ͣ�G-���ٶ��� K-���� T-�յ��ؿ� D-������ Z-ֱ���ؿ� Q-����
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	            params.put("dtype","");//�������ݵĸ�ʽ,xml��json��Ĭ��json
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println("4"+object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	    //5.12306ʵʱ��Ʊ��ѯ
	    public  JSONObject getRequest5(String start_Station,String end_Station,String gDate){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/s2swithprice";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	            params.put("dtype","");//�������ݵĸ�ʽ,xml��json��Ĭ��json
	            params.put("start",start_Station);//����վ,�磺�Ϻ�����
	            params.put("end",end_Station);// ����վ,�磺������
	            params.put("date",gDate);//�������ڣ�Ĭ�Ͻ���
	            params.put("tt","");//�������ͣ�Ĭ��ȫ�����磺G(����)��D(����)��T(�ؿ�)��Z(ֱ��)��K(����)��Q(����)
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	            	return object;
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			return null;
	    }
	 
	    //6.12306��Ʊ�٣���ѯ����
	    public  JSONObject getRequest6(String start_Station,String end_Station,String gDate){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/ticket.cc.php";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("from",start_Station);//����վ���ƣ����Ϻ�����
	            params.put("to",end_Station);//����վ���ƣ���������
	            params.put("date",gDate);//Ĭ�ϵ��죬��ʽ��2014-07-11
	            params.put("tt","");//�������ͣ�Ĭ��ȫ�����磺G(����)��D(����)��T(�ؿ�)��Z(ֱ��)��K(����)��Q(����)
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                return object;
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	 
	    //7.��Ʊ���۵��ѯ
	    public  void getRequest7(){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/dsd";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("province","");//ʡ��,�磺�㽭
	            params.put("city","");//���У��磺����
	            params.put("county","");//��/�أ��磺¹����
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	            params.put("dtype","");//�������ݵĸ�ʽ,xml��json��Ĭ��json
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println("7"+object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	    //8.�г�վ���б�
	    public  void getRequest8(){
	        String result =null;
	        String url ="http://apis.juhe.cn/train/station.list.php";//����ӿڵ�ַ
	        Map<String, String> params = new HashMap<String, String>();//�������
	            params.put("key",APPKEY);//Ӧ��APPKEY(Ӧ����ϸҳ��ѯ)
	            params.put("dtype","");//�������ݵĸ�ʽ,xml��json��Ĭ��json
	 
	        try {
	            result =net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println("8"+object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 
	 
	 
//	    public  void main(String[] args) {
//	    	JSONObject object=new JSONObject();
//	    	object=getRequest5();
//	    	JSONObject result=JSONObject.fromObject(object.get("result"));
//	    	JSONArray list=JSONArray.fromObject(result.get("list"));
//	    	for(int i=0;i<list.size();i++){
//	    		System.out.println(list.get(i));
//	    	}
//	    	
//	    	System.out.println(object.get("result"));
//	    }
	 
	    /**
	     *
	     * @param strUrl �����ַ
	     * @param params �������
	     * @param method ���󷽷�
	     * @return  ���������ַ���
	     * @throws Exception
	     */
	    public static String net(String strUrl, Map<String, String> params,String method) throws Exception {
	        HttpURLConnection conn = null;
	        BufferedReader reader = null;
	        String rs = null;
	        try {
	            StringBuffer sb = new StringBuffer();
	            if(method==null || method.equals("GET")){
	                strUrl = strUrl+"?"+urlencode(params);
	            }
	            URL url = new URL(strUrl);
	            conn = (HttpURLConnection) url.openConnection();
	            if(method==null || method.equals("GET")){
	                conn.setRequestMethod("GET");
	            }else{
	                conn.setRequestMethod("POST");
	                conn.setDoOutput(true);
	            }
	            conn.setRequestProperty("User-agent", userAgent);
	            conn.setUseCaches(false);
	            conn.setConnectTimeout(DEF_CONN_TIMEOUT);
	            conn.setReadTimeout(DEF_READ_TIMEOUT);
	            conn.setInstanceFollowRedirects(false);
	            conn.connect();
	            if (params!= null && method.equals("POST")) {
	                try {
	                    DataOutputStream out = new DataOutputStream(conn.getOutputStream());
	                        out.writeBytes(urlencode(params));
	                } catch (Exception e) {
	                    // TODO: handle exception
	                }
	            }
	            InputStream is = conn.getInputStream();
	            reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
	            String strRead = null;
	            while ((strRead = reader.readLine()) != null) {
	                sb.append(strRead);
	            }
	            rs = sb.toString();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (reader != null) {
	                reader.close();
	            }
	            if (conn != null) {
	                conn.disconnect();
	            }
	        }
	        return rs;
	    }
	 
	    //��map��תΪ���������
	    public static String urlencode(Map<String,String> data) {
	        StringBuilder sb = new StringBuilder();
	        for (Map.Entry<String,String> i : data.entrySet()) {
	            try {
	                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
	            } catch (UnsupportedEncodingException e) {
	                e.printStackTrace();
	            }
	        }
	        return sb.toString();
	    }
	  
	
}
