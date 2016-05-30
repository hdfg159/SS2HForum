/**
 * @author hdfg159
 * @date 下午8:52:08
 */
package utils;

/**
 * @author hdfg159
 * @date 下午8:52:08
 */
public class LogUtil {
	public final static boolean isEnable = true;

	/**
	 * 打印输出
	 * 
	 * @param msg
	 */
	public static void i(Object msg) {
		if (isEnable) {
			System.out.println(msg);
		}
	}

	/**
	 * 打印错误
	 * 
	 * @param msg
	 */
	public static void e(Object msg) {
		if (isEnable) {
			System.err.println(msg);
		}
	}
}
