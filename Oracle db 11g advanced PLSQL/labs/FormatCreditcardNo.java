public class FormatCreditCardNo {
	public static final void formatCard (String[] cardNo) {
		int count = 0;
		int space = 0;
		String oldcc = cardNo[0];
		String[] newcc = {""};
		while (count<16) {
			newcc[0] += oldcc.charAt(count);
			space++;
			if (space==4) {
				newcc[0] += " ";
				space=0;
			}
			count++;
		}
		cardNo[0] = newcc[0];
	}
}