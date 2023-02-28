package chap07;

public class Calc {
	private int num1;
	private int num2;
	private String operator;
	
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public int getNum1() {
		return this.num1;
	}
	public int getNum2() {
		return this.num2;
	}
	public String getOperator() {
		return this.operator;
	}
	public double operateResult() {
		double result = 0.0;
		if(this.operator.equals("+")) {
			result = num1 + num2;
		}else if(this.operator.equals("-")) {
			result = num1 - num2;	
		}else if(this.operator.equals("*")) {
			result = num1 * num2;
		}else if(this.operator.equals("/")) {
			result = num1 / num2;
		}
		return result;
	}
}
