package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ZZY2015 on 2016/2/15.
 */
public class TimeUtils {
	public static final SimpleDateFormat DEFAULT_DATE_FORMAT = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	public static final SimpleDateFormat DATE_FORMAT_DATE = new SimpleDateFormat(
			"yyyy-MM-dd");
	public static final SimpleDateFormat CHINESE_DATA_FORMAT = new SimpleDateFormat(
			"yyyy年MM月dd日 HH时mm分ss秒");

	private TimeUtils() {
		throw new AssertionError();
	}

	public static String getTime(long timeInMillis, SimpleDateFormat dateFormat) {
		return dateFormat.format(new Date(timeInMillis));
	}

	public static String getTime(long timeInMillis) {
		return getTime(timeInMillis, DEFAULT_DATE_FORMAT);
	}

	public static long getCurrentTimeInLong() {
		return System.currentTimeMillis();
	}

	/**
	 * 默认格式输出时间
	 *
	 * @return
	 */
	public static String getCurrentTimeInString() {
		return getTime(getCurrentTimeInLong());
	}

	/**
	 * 输入格式显示当前时间
	 *
	 * @param dateFormat
	 * @return
	 */
	public static String getCurrentTimeInString(SimpleDateFormat dateFormat) {
		return getTime(getCurrentTimeInLong(), dateFormat);
	}
}
