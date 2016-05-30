/**
 *  Copyright (c) 2016 by hdf159.All rights reserved.
 */
package test;

import model.Posts;
import model.Usertable;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import service.IPostService;
import service.IUserService;

public class testHibernate {
	@Test
	public void checkUser() throws Exception {
		IUserService userService = (IUserService) new ClassPathXmlApplicationContext(
				"applicationContext.xml").getBean("userService");
		Usertable usertable = userService.check("hdfg159", "12315");
		System.out.println(usertable.getUsername());
		for (Posts post : usertable.getUserPosts()) {
			System.out.println(post.getTitle());
		}
	}

	@Test
	public void deletePost() throws Exception {
		IPostService postService = (IPostService) new ClassPathXmlApplicationContext(
				"applicationContext.xml").getBean("postService");
		Posts post = postService.findById(88);
		System.out.println(post.getTitle());
		System.out.println(post.getUser().getUsername());
		postService.delete(88);
	}

	@Test
	public void deleteUser() throws Exception {

	}
}
