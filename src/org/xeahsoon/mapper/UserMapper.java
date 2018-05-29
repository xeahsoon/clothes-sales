package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.xeahsoon.pojo.User;

/**
 * UserMapper接口
 * */
public interface UserMapper {
	
	
	/**
	 * @param id 用户ID
	 * @return 指定ID的用户
	 */
	@Select("select * from user where id=#{id}")
	User selectUserById(@Param("id")int id);
	
	/**
	 * @return 返回所有用户（店长用户）
	 */
	@Select("select * from user")
	List<User> showUsers();
	
	/**
	 * @param loginname 登录名
	 * @param password 密码
	 * @return 找到返回User对象，没有找到返回null
	 */
	@Select("select * from user where loginname = #{loginname} and password = #{password}")
	User findWithLoginnameAndPassword(@Param("loginname")String loginname,
			@Param("password") String password);
	
	/**
	 * @param loginname 登录名
	 * @return 记录条数
	 */
	@Select("select * from user where loginname = #{loginname}")
	User selectUserByLoginName(@Param("loginname")String loginname);
	
	/**
	 * @param loginname 登录名
	 * @param password 密码
	 * @param name 用户名
	 * @param phone 联系方式
	 * @return 添加结果
	 */
	@Insert("insert into user(loginname, password, name, phone) "
			+ "values(#{loginname}, #{password}, #{name}, #{phone})")
	int registerNewUser(@Param("loginname")String loginname, @Param("password")String password,
			@Param("name")String name, @Param("phone")String phone);
	
	/**
	 * @param loginname 登录名
	 * @param name	用户名
	 * @param phone 电话
	 * @param password 密码
	 * @return	更新信息结果
	 */
	@Update("<script>"
			+ "update `user` set name = #{name}, phone = #{phone} "
			+ "<if test='password != null'> "
			+ ", password = #{password}"
			+ "</if> "
			+ "where loginname = #{loginname}"
			+ "</script>")
	int updateUserInfo(@Param("loginname")String loginname, @Param("name")String name,
			@Param("phone")String phone, @Param("password")String password);
	
	/**
	 * @param loginname 登录名
	 * @return 审核/反审核结果
	 */
	@Update("update `user` set status = 1-status where loginname = #{loginname}")
	int checkUser(@Param("loginname")String loginname);
	
	/**
	 * @param loginname 登录名
	 * @return 重置密码结果
	 */
	@Update("update `user` set password = '123123' where loginname = #{loginname}")
	int resetUserPwd(@Param("loginname")String loginname);

}
