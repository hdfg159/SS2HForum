/**
 * @author hdfg159
 * @date 上午9:12:09
 */
package utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import model.Posts;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.collections.ComparatorUtils;
import org.apache.commons.collections.comparators.ComparableComparator;
import org.apache.commons.collections.comparators.ComparatorChain;

public class PostsUtil {
	@SuppressWarnings("unchecked")
	public static List<Posts> sortpost(List<Posts> posts, String param) {
		Comparator comparator = ComparableComparator.getInstance();
		comparator = ComparatorUtils.reversedComparator(comparator);
		List<Object> sortFields = new ArrayList<Object>();
		sortFields.add(new BeanComparator(param, comparator));
		ComparatorChain multiSort = new ComparatorChain(sortFields);
		Collections.sort(posts, multiSort);
		return posts;
	}
}
