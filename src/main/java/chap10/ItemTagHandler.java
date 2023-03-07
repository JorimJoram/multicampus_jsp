package chap10;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;


public class ItemTagHandler extends SimpleTagSupport{
	private String title;
	private String colName;

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		JspFragment body = getJspBody();
		Product product = new Product();
		
		StringBuffer result = new StringBuffer(); //String은 고정, Stringbuffer -> 변경이 가능. 배열과 ArrayList의 차이 정도로 이해해도 될 듯
		
		if(body != null) {//content가 있다면
			out.println("<h2>");
			body.invoke(null);
			out.println("</h2>");
		}
		result.append("<hr/><h4>")
		.append(title)
		.append("</h4><table><tr><th>")
		.append(colName)
		.append("</th></tr>");
		out.println(result.toString());
		
		for(String prod : product.getProductList()) {
			out.println("<tr><td>" + prod + "</td></tr>");
		}
		result.append("</table>");
	}

	public String getTitle() {
		return title;
	}

	public String getColName() {
		return colName;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setColName(String colName) {
		this.colName = colName;
	}
	
	
	
}
