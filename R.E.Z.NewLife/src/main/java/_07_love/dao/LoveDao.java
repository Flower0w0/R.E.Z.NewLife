package _07_love.dao;

import java.sql.Connection;
import java.util.List;

import _07_love.model.LoveBean;

public interface LoveDao {

	void save(LoveBean lvb);

	LoveBean findById(int id);

	List<LoveBean> findByMember_Id(int member_Id);

	void setConnection(Connection con);

	List<LoveBean> findByM_IdAndN_Id(int member_Id, int newproduct_Id);
	
	void delete(int id);

	List<LoveBean> findByM_IdAndO_Id(int member_Id, int oldproduct_Id);
}