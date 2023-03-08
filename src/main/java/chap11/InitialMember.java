package chap11;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class InitialMember implements ServletContextListener {
	
    public void contextInitialized(ServletContextEvent sce)  { //WAS가 특정 이벤트가 발생했을 때 호출 -> 웹 어플리케이션이 시작할 때
    	ServletContext context = sce.getServletContext();      //어플리케이션 내장 객체
    	ArrayList<Member> members = new ArrayList<Member>();   
    	
    	for(int i=0; i<8; i++) {
    		members.add(new Member("박효준" + i, "parkHoyhoy@hanmail.net"));
    	}
    	members.add(new Member("최현일", null));
    	members.add(new Member("심준석", null));
    	
    	//application에 넣어줌으로써 공유데이터가 됨 -> 과제할 떄는 이걸가지고 최초 리스트 만들어내면 쓸만할듯? 전체 공유되어야하는 것도 맞고
    	context.setAttribute("members", members); 
    	context.setAttribute("member", new Member());
    	
    	ArrayList<String> items = new ArrayList<String>();
    	for(int i=0; i<5; i++) {
    		items.add("item"+(i+1));
    	}
    	context.setAttribute("itemList", items);
    	
         System.out.println("Initial Member Start!");
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("Initial Member Destroy!");
    }
}
