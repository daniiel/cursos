public class Factorial {
	public static int calcFactorial (int n) {
		if (n ==1) return 1;
		else return n * calcFactorial (n -1); }}